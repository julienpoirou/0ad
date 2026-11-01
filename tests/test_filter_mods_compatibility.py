import importlib.machinery
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest

SCRIPT = Path(__file__).resolve().parents[1] / "scripts" / "filter-mods-compatibility"
LOADER = importlib.machinery.SourceFileLoader("filter_mods_compatibility", str(SCRIPT))
SPEC = importlib.util.spec_from_loader(LOADER.name, LOADER)
FILTER = importlib.util.module_from_spec(SPEC)
LOADER.exec_module(FILTER)


class VersionComparisonTest(unittest.TestCase):
    def test_engine_comparison_boundaries(self):
        cases = [
            ("0.28.0", "=", "0.28.0", True),
            ("0.28.0", "=", "0.28", False),
            ("0.28.0", ">=", "0.0.27", True),
            ("0.28.0", ">=", "0.28.1", False),
            ("0.28.0", "<=", "0.0.27", False),
            ("0.28.0", "<=", "0.28.0", True),
            ("0.28.0", ">", "0.27.9", True),
            ("0.28.0", "<", "0.28.1", True),
        ]
        for version, operator, required, expected in cases:
            with self.subTest(version=version, operator=operator, required=required):
                self.assertIs(
                    FILTER.compare_versions(version, operator, required), expected)


class CollectionFilterTest(unittest.TestCase):
    def add_mod(self, root, name, dependencies, ignore=False):
        path = root / name
        path.mkdir()
        (path / "mod.json").write_text(json.dumps({
            "name": name,
            "dependencies": dependencies,
            "ignoreInCompatibilityChecks": ignore,
        }), encoding="utf-8")

    def test_only_compatible_mods_remain(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            self.add_mod(root, "exact", ["0ad=0.28.0"])
            self.add_mod(root, "minimum", ["0ad>=0.0.26"])
            self.add_mod(root, "unversioned", ["0ad"])
            self.add_mod(root, "old", ["0ad=0.0.27"], ignore=True)
            self.add_mod(root, "future", ["0ad>=0.28.1"])
            self.add_mod(root, "public", [])

            report = root / "report.json"
            result = FILTER.main([
                "filter-mods-compatibility",
                "--mods", str(root), "--game-version", "0.28.0",
                "--report", str(report),
            ])

            self.assertEqual(result, 0)
            self.assertEqual(
                sorted(path.name for path in root.iterdir() if path.is_dir()),
                ["exact", "minimum", "public", "unversioned"],
            )
            selection = json.loads(report.read_text(encoding="utf-8"))
            self.assertEqual(len(selection["compatible"]), 3)
            self.assertEqual(
                {entry["folder"] for entry in selection["excluded"]},
                {"old", "future"},
            )


if __name__ == "__main__":
    unittest.main()
