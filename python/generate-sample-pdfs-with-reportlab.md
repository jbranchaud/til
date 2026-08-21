# Generate Sample PDFs With ReportLab

The `reportlab` package has a `pdfgen` module that provides a `Canvas` API for
programmatically constructing a PDF.

I recently needed the most basic use of this to quickly construct a sample PDF
that I could use as I experimented with [different `qpdf`
commands](/workflow/remove-pages-from-a-pdf.md). I wanted to generate a 10-page
PDF where each page included a large font number in the center. This way I could
clearly see what was the first, second, third, and so on pages. Then I could
quickly verify that the `qpdf` manipulations I was doing were working as
expected.

I was able to do this without any setup or install. Using a `uv` one-liner (does
a 10-line heredoc count as a one-liner?), I generated a PDF with some basic
canvas rendering on each page.

```python
❯ uv run --with reportlab python - <<'EOF'
from reportlab.pdfgen import canvas
N, W, H = 10, 612, 792
c = canvas.Canvas("test.pdf", pagesize=(W, H))
for i in range(1, N + 1):
    c.setFont("Helvetica-Bold", 220)
    c.drawCentredString(W / 2, H / 2 - 80, str(i))
    c.setFont("Helvetica", 28)
    c.drawCentredString(W / 2, 100, f"page {i} of {N}")
    c.showPage()
c.save()
EOF
```

The `--with` makes the `reportlab` package available to the command being run.
The command being run is `python` which evaluates that block of heredoc text.

Within the heredoc, I import `canvas` from the `reportlab` package that has been
made available. I then create an in-memory PDF of a standard size. Then for-loop
10 times to build each page of the PDF with a big number in the middle and a
smaller `page x of N` lower down on the page. Finally, I save the PDF which
writes it to the directory I executed this whole command from.

I had Claude help with the `canvas` API, however there are some decent
[`reportlab.pdfgen` docs
here](https://docs.reportlab.com/reportlab/userguide/ch2_graphics/).
