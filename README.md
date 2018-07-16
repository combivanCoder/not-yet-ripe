# Prototypes
**Please Note**
> All repos moving from GitHub to GitLab over the next six months.
> Accounts will be linked but the maintenance of code will shift from GitHub for all but smallest products

I'm going to create a separate repository to cover anything that's vaguely release worthy.

So this is largely a dumping ground for my prototypes - some are scripts I've used to get round problems, some are concepts I've used to demonstratve particular approaches to problem solving.

If other people find them useful they're welcome to re-use or improve upon the implementations.

In the near future I'll be pushing:

## sendEncryptedEmail
Intended for use by cron jobs sending notification emails (logs etc). I needed a way of protecting the content of those emails to prevent prying eyes getting a load of 'useful' data about the originating systems.

_Updated_: This is largely unchanged in over a year and shown to be a practiable approach.

## How To Hash
A lot of the work I do involves explaining to spammers that they don't need "do not distribute" lists - especially after these lists have been accidentally sold on as a leads list.

I've been working on an Excel workbook using macros (I know - I'm sorry, but the target audience are running their businesses on Excel) although I may post a .NET desktop app equivelant or powershell script

## Tresorit Verification Script
To verify the signature of Tresorit packages isn't as simple as most standard signature+file. I doubt I'll remember how to do it if there is a difference of more than a few months between releases so automated through a script
_Updated_: This is no longer updated because I stopped using Tresorit. There were defects in the linux client which would delete files which were untouched. No explaination was received from the vendor despite repeated requests, as documented [here](https://iexplorable.blogspot.com/2017/01/disaster-recovery.html)
