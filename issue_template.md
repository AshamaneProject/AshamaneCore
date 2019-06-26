<!--- (*************************************************************)
      (** Fill in the following fields, WE DO NOT SUPPORT REPACKS***)
      (**********************************)
      For SQL fixes:
      don't modify WDB fields without supply one sniff of those fields (censure guids, character names, anything blizzard can use to identify source)
      don't use pull requests for sql only fixes, unless it's to fix one existing unable to apply file.
      don't hardcode guids.
      don't DELETE + INSERT to update only few fields of one row.
      don't use database names.
      don't put ' around numbers.
      don't put ( ) if they aren't needed.
      use only 1 DELETE + INSERT when we add multiple items to one table, unless you are scripting multiple creatures.
      put default values on every new column we want to add on that way we can make smallers inserts.
      start fix by -- in case some previous sql misses proper ending.
      DELETE by guid AND entry to be sure we don't delete existing spawns.
      start sql code with 3 ` sql         --->

**Description:**

CHANGEME Description of the problem or issue here. Wowhead link will be appreciated.

**Current behaviour:**

CHANGEME Tell us what happens.
If this is a crash, post the crashlog (upload to https://gist.github.com/). Do not post entire log here.

**Expected behaviour:**

CHANGEME Tell us what should happen instead.

**Project(s): <-- Mandatory**

- [ ] Issue found playing in Live Ashamane Private Server.
- [ ] Issue found in a compiled master repo from Git.

**TC rev. hash/commit:** 

CHANGEME Mandatory if Project == compiled master repo from Git, found it in first line of Server.log

**Database version**

CHANGEME What DB do you use, TDB, ADB, other.

**Operating system:** CHANGEME OS


<!--- Notes
- This template is for problem reports. For other types of report, edit it accordingly.
- For fixes containing C++ changes, create a Pull Request.
--->
