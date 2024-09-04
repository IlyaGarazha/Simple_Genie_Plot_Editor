# Genie_plot_properties_editor 
using Main.PlotEnhancement
using Stipple, Stipple.ReactiveTools
using StippleUI

trace1 = set_trace_1(5)
trace2 = set_trace_2("black")
layout = Main.PlotEnhancement.layout

# variables for checkboxes handling
@vars CheckboxModel begin
    add_red::R{Bool} = true
    add_grn::R{Bool} = true
    add_blu::R{Bool} = true
end

@app begin
    # coloring variables
    @in add_red = true
    @in add_grn = true
    @in add_blu = true

    @in marker_size = 5

    @out plotdata = [trace1, trace2]
    @out plotlayout = layout

    @onchange add_red, add_grn, add_blu begin
        global trace2 = set_trace_2(mix_RGB(add_red, add_grn, add_blu))
        plotdata = [trace1, trace2]
    end

    @onchange marker_size begin
        global trace1 = set_trace_1(marker_size)
        plotdata = [trace1, trace2]
    end
end

function ui()
    [checkbox(label="Red", color="red", fieldname=:add_red, dense=true, size="xl"),
        checkbox(label="Green", color="green", fieldname=:add_grn, dense=true, size="xl"),
        checkbox(label="Blue", color="blue", fieldname=:add_blu, dense=true, size="xl"),
        row([
            cell(class="st-col col-4", [
                h5(style="color: purple;", "marker size"),
                slider(5:1:30, :marker_size, label="marker size", color="purple")
            ])
        ]),
        plot(:plotdata, layout=:plotlayout)
    ]
end

@page("/", ui)

