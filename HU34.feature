Feature: Declarar "Unidad Llena"
    Como transportista,
    deseo marcar mi camión como completo,
    para dejar de aparecer en el mapa de búsqueda de otros usuarios.

    Scenario 1: Ocultamiento automático del vehículo en el mapa por capacidad máxima
        Given que el vehículo de carga ha completado su capacidad máxima permitida
        When activo la opción para declarar el estado de la unidad completa
        Then el sistema deshabilita mi visibilidad en los mapas de búsqueda de los clientes
        And mantiene este estado restrictivo hasta el proceso de descarga en el destino final

        INPUT:
            Estado de capacidad del vehículo (máxima alcanzada)
            Acción de activar la opción de unidad completa

        OUTPUT:
            Estado de visibilidad del vehículo modificado a privado u oculto
            Exclusión del vehículo en los resultados de búsqueda de los productores

    Scenario 2: Reactivación automática de la visibilidad tras la descarga completa
        Given un transportista con el estado de unidad completa previamente configurado
        When el sistema confirma que el vehículo ha descargado toda la mercadería en el mercado
        Then la plataforma restablece de forma automática la disponibilidad del transportista
        And el vehículo vuelve a aparecer visible de manera pública en el mapa interactivo

        INPUT:
            Estado previo de unidad completa activo
            Confirmación de descarga total de la mercadería en destino

        OUTPUT:
            Estado de disponibilidad restablecido a activo
            Reaparición del icono del vehículo en el mapa público de búsquedas
