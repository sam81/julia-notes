##PyPlot (matplotlib)

````julia
using PyCall, PyPlot
x = collect(0:0.1:2*pi)
plot(x, sin.(x))
````


````
1-element Array{PyCall.PyObject,1}:
 PyObject <matplotlib.lines.Line2D object at 0x7fa9cb15ee48>
````


![](figures/pyplot_1_1.png)


##### Saving multiple plots in one pdf with PyPlot

````julia
using PyCall, PyPlot
@pyimport matplotlib.backends.backend_pdf as backend_pdf

pdf_pages = backend_pdf.PdfPages("multipage_pdf.pdf")
x = collect(0:0.1:2*pi)
plot(x, sin.(x))
savefig(pdf_pages, format="pdf")
close()
plot(x, cos.(x))
savefig(pdf_pages, format="pdf")
close()
pdf_pages[:close]()
````


