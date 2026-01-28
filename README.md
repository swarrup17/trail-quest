## Tests folder

This folder is the **test repository** for the TrailQuest web application. It contains all UI automation suites written in Robot Framework using SeleniumLibrary, plus separate tabular documentation of each test case (IDs, steps, expected/actual results, severity, priority, etc.).

### Suites in this folder

- `home_page_button.robot`  
  - Verifies homepage header buttons and main elements on the landing page are visible and clickable.
- `treks_tours.robot`  
  - Covers the **Treks & Tours** journeys (Push Your Limit, Kanchenjunga, Everest via Gokyo, Annapurna/Manaslu circuits, ABC/EBC, Mardi, Langtang, Poon Hill, Amayangri).
- `declutter_your_mind.robot`  
  - Tests all retreats under **Declutter Your Mind** (Annapurna Reset, Mardi Path, Khopra Reset, Ghandruk Reset).
- `explore_the_ancient.robot`  
  - Tests tours under **Explore The Ancient** (Off the Beaten, Muktinath, KPL, 7 UNESCO Heritage, KTM Valley Tour, Narayanhiti Durbar, Kathmandu Durbar).
- `reconnect_with_nature.robot`  
  - Tests packages under **Reconnect With Nature** (Nepal Unbound Heritage, The Valley Tales, The Nepal Tales, The Kalinchwok Crest).

### How to run the suites

From the project root:

```bash
robot tests
```

To run a single suite and save output in results folder:

```bash
robot -d results tests/treks_tours.robot
```

### Test case tables

For each suite, there is a corresponding test-case table (for example in Excel or another document) using the format:

`Test ID | Test Scenario / Description | Precondition | Test Steps | Expected Result | Actual Result | Test Environment | Severity | Priority | Tester Name | Status | Date | Remarks / Evidence`

Those tables should be updated whenever a test is added or changed in the `.robot` files so this folder always acts as the single source of truth for TrailQuest test design and automation.

