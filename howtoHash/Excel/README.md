###Notes
- I exported the VBA modules to make it easier to version track
- Will have to manually verify that the latest .bas is actually the export of what's currently in the Excel workbook
- do the changes in Excel, get 'em working then export the .bas files
- on commit / merge the simple text diff should highlight anything that needs to be back merged into the workbook
- There's no way of doing this in Excel without the associated security setting adjustments related to Excel Trust Centre
- Considering moving from XLSM to XSLB but think there may be situations where interoperability *may* be needed

####mod_Comparisons.bas
All the macros and methods created to operate the functionality in this specific workbook - there's only really three functions needed and they're very simple.

Seemed to be a gap between Excel 2013 x64 TLB and some of the MSDN references so have gone "back to basics" on simple algos.

####mod_SimpleAlgos.bas
I've re-used a pretty good answer from stackoverflow - hopefully this kind of approach would be widely used.

The problem is where the algorithm changes (nd any hashed list then has to be regenerated, nullifying the point of the exercise. For that reason I'll block any changes to this code file unless there's an exceptionally good reason to do so.
