# HDI_ORDA_CRUD

> **How do I create, update, and delete data with ORDA?**
> A 4D "How Do I" (HDI) example project showing the CRUD cycle on the DataStore using entities and entity selections.

![4D](https://img.shields.io/badge/4D-21-blue) ![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Windows-lightgrey) ![License](https://img.shields.io/badge/license-see%20LICENSE-green)

## Origin

Originally a binary `.4DB` database distributed with 4D v17, converted to a project (`.4DProject`) with 4D 21 and then modernised.

- **Blog post:** https://blog.4d.com/create-update-and-delete-data-with-orda/
- **Original download:** https://download.4d.com/Demos/4D_v17/HDI_ORDA_CRUD.zip

## What it demonstrates

| Topic | Where |
|-------|-------|
| Create an entity (`ds.Contact.new()` + `save()`), with and without a related company | `HDI2` pages 2-3, `Button1`, `Button2` |
| Update an entity bound to a list box selection | `UpdateButton`, `UpdateWithCompanyButton` |
| Drop one entity, or an entity selection and inspect what was not dropped | `DropContactsButton` |
| Check `status.success` after every `save()` / `drop()` | all object methods |
| Bulk-load data with `fromCollection()` from JSON resources | `buildDataFromJSON` |
| Collection list boxes: `currentItemSource`, `selectedItemsSource`, `This.*` columns | `HDI2` |
| Reselect a saved entity in a list box with `indexOf()` | list box object methods |

## Points of interest

- **ORDA only** -- contacts and companies are handled as entities (`Form.contactToSave`, `Form.contactToCreate`) rather than records; classic tables are used only for the `INFO` text shown in the tabs.
- **Form-scoped state** -- the demo data (`Form.contacts`, `Form.companiesForUpdate`, ...) lives on the `Form` object; only the debug `Trace` checkbox uses a process variable.
- **Startup pattern** -- `00_Start` runs without parameters from `onStartup`/the menu, reuses an already open window, and otherwise delegates to the application process with `CALL WORKER`; the splash and demo windows use non-blocking `DIALOG(...; *)`.
- **Empty data classes are seeded** at startup from `Resources/*.4ie` / `*.4si` import definitions.
- **Localised** -- all UI text comes from XLIFF (`en`, `ja`); strings with dynamic parts use `{placeholder}` substitution.
- **Dark mode and macOS Tahoe** -- colours use `automatic` values or light/dark CSS classes; buttons are 27px under Liquid Glass and 23px in classic macOS (`styleSheets_mac.css`).

## Project layout

```
Project/Sources/
  Methods/        00_Start (entry point), buildDataFromJSON, initPages, RW, Compiler_*
  Forms/HDI       splash dialog (version/licence check, "Demo" button)
  Forms/HDI2      tabbed CRUD demo
  TableForms/     INFO, Contact, Company input/output forms
  menus.json      menu bar (standard actions)
  styleSheets*.css  cross-platform, macOS and Windows styles
Resources/
  en.lproj, ja.lproj   XLIFF (menu, messages, HDI, HDI2, tableForms)
  *.json, *.4ie, *.4si sample data and import definitions
```

## Requirements

4D 21 or later (the original example required 4D v17). No extra licence is needed.

## Getting started

1. Open `Project/HDI_ORDA_CRUD.4DProject` in 4D.
2. Run **File > Demo** (or `00_Start`) to open the splash dialog, then click **Demo**.
3. Walk through the tabs: query, create/update, create/update with a company, and drop.

## References

- [ORDA overview](https://developer.4d.com/docs/ORDA/overview)
- [Entities](https://developer.4d.com/docs/ORDA/entities) and [data model classes](https://developer.4d.com/docs/ORDA/dsMapping)
- [`CALL WORKER`](https://developer.4d.com/docs/commands/call-worker) and [`DIALOG`](https://developer.4d.com/docs/commands/dialog)
- [Form stylesheets and media queries](https://developer.4d.com/docs/FormEditor/stylesheets)
- [XLIFF localisation](https://developer.4d.com/docs/Project/localization)

## License

See [LICENSE](LICENSE).
