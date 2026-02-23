# DFIR Challenge Notebook Generation - MFT Analysis with Interactive Tables

I'm documenting a digital forensics challenge (HackTheBox Sherlock: BFT) in Google Colab. I need you to transform my VisiData investigation workflows into Python cells that use interactive tables to show the analytical progression.

## Challenge Context

**Sherlock: BFT**
Focus: MFT (Master File Table) forensics using MFTECmd to parse MFT artifacts and identify malicious activity on a compromised system.

**Scenario:** Attacker targeted user "Simon Stark" on February 13, 2024. Investigation involves timeline analysis of file creation, user account activity, and malicious file identification.

## Technical Setup (Already Complete)

The notebook already has:
1. MFTECmd installed via dotnet
2. MFT file parsed to CSV: `/content/analysis/mft_parsed.csv`
3. Interactive tables enabled via itables:

```python
!pip install itables -q
from itables import init_notebook_mode, show
import itables.options as opt
init_notebook_mode(all_interactive=True)
opt.lengthMenu = [10, 25, 50, 100, 500]
opt.maxBytes = 0
```

## My Local Workflow Tool: VisiData (vd)

I perform analysis locally using VisiData (vd), a TUI for CSV exploration. You'll need to translate VisiData operations into equivalent pandas code.

## Output Requirements

For each task, generate a **SINGLE Python cell** that:

1. **Shows the investigative progression** as multiple `show()` calls (interactive tables)
2. **Documents each step** with comments CONCISELY explaining what VD operation is being replicated
3. **Mimics the exploration flow** - frequency checks, filtering, narrowing down results
4. **Uses itables' show()** for output, NOT print() or regular dataframe display

### Critical Rules:

1. **One cell per task** - All steps in a single Python cell, multiple show() outputs
2. **Interactive tables only** - Use `show()` for all dataframe displays
3. **Show the thinking** - Print statements between steps CONCISELY explaining what we're looking for
4. **Preserve exploration** - If the VD workflow checked frequency distributions, show those tables
5. **Final result highlighted** - The last show() should display the answer-containing rows

## Task 1 Workflow (EXAMPLE PROVIDED)

**Question:** What was the name of the ZIP file downloaded on Feb 13, 2024?

**My VD workflow on local machine:**
1. Opened CSV in vd: `vd mftecmd-output/*.csv`
2. Navigate to `Created0x10` column
3. Press Shift+2 (To remove hours:minutes:seconds from the dates)
4. Press Shift+F (This is frequency analysis yeah, but I did it just to get a neat view of the available days throughout each month in the year and their respective activeness)
5. Press `/` to search for "2024-02-13", press Enter
6. New sheet appears with filtered results
7. Navigate to `Extension` column, Shift+F again
8. Press `/` and search for ".zip", press Enter, which obtained a sheet of all zip files on that particular day
9. Found the answer in `FileName` column

## Your Task

**For Task 1:** Generate the Python cell following the pattern above, replicating and parallelizing my aforementioned VD workflow as a sequence of pandas operations with interactive table outputs.

**For Tasks 2-8:** Wait for me to provide the VD workflow for each task, then generate the corresponding Python cell.

## What I'll Provide Next

After you generate Task 1, I'll send:
```
Task N: [Question]
VD workflow:
1. [Step]
2. [Step]
...
```

Then you generate the single Python cell for that task.

---

**Begin with Task 1. I will provide subsequent task workflows after you complete each one.**
