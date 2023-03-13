$(function () {
    $("#terminoBusqueda").on("input", function () {
        var terminoBusqueda = $(this).val();
        $.ajax({
            url: '/Productos/Buscar',
            data: { terminoBusqueda: terminoBusqueda },
            success: function (resultados) {
                $("#resultadosBusqueda").empty();
                $.each(resultados, function (index, resultado) {
                    $("#resultadosBusqueda").append("<p>" + resultado.nombre + "</p>");
                });
            }
        });
    });
});
