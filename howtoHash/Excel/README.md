###Purpose
One of the most frequent excuses spammers give when they're caught selling email lists is that it was an *accidental* share of a do-not-contact list - or exclusion list. Or perhaps a *former employee* took it with them when they left.

But they can't remember who that was...Seems to happen with amazing frequency. Basically there's a lot of excuses out there.

So how do you ensure that someone can't lift the list of valid email addresses or contact numbers and re-use them? Simple - you translate your exclusion list into hashed values. At that point you're no longer storing plain text block / exclusion lists.

Either have the developers integrate their automated process (replicating this process, but not using the spreadsheet), or manually compare those hashed values to any new data using the spreadsheet. If using the latter, the resulting list could then be used in a mail merge without storing any blocked contact details.

That way someone who doesn't want spam doesn't repeatedly get spammed and data traders don't need to store raw data which can be nicked.

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

The problem is where the algorithm changes any hashed list then has to be regenerated, nullifying the point of the exercise. For that reason any changes to this code file should be defered unless there's an exceptionally good reason to do so.

**Remember:** The point of the exercise is not to provide forever unbreakable ciphers but to sit in the middle ground (and no plain-text contact details are stored).
