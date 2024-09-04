module PlotEnhancement

using PlotlyBase

export mix_RGB, set_trace_1, set_trace_2, layout

function mix_RGB(R::Bool, G::Bool, B::Bool)::String
    if (R, G, B) == (0, 0, 0)
        return "black"
    elseif (R, G, B) == (0, 0, 1)
        return "blue"
    elseif (R, G, B) == (0, 1, 0)
        return "green"
    elseif (R, G, B) == (0, 1, 1)
        return "cyan"
    elseif (R, G, B) == (1, 0, 0)
        return "red"
    elseif (R, G, B) == (1, 0, 1)
        return "purple"
    elseif (R, G, B) == (1, 1, 0)
        return "yellow"
    elseif (R, G, B) == (1, 1, 1)
        return "white"
    end
end

function set_trace_1(trace_size::Int)
    return scatter(
        x=[1, 2, 3, 4],
        y=[10, 15, 13, 17],
        mode="markers",
        name="Trace 1",
        marker=attr(size=trace_size, color="purple")
    )
end

function set_trace_2(trace_color::String)
    return scatter(
        x=[1, 2, 3, 4],
        y=[5, 9, 11, 12],
        mode="lines+markers",
        name="Trace 2",
        line=attr(color=trace_color)
    )
end

layout = PlotlyBase.Layout(
    title="A Scatter Plot with Multiple Traces",
    xaxis=attr(
        title="X Axis Label",
        showgrid=false
    ),
    yaxis=attr(
        title="Y Axis Label",
        showgrid=true,
        range=[0, 20]
    )
)

end
