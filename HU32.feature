Feature: Ofertas en el camino
    Como transportista,
    deseo recibir alertas de carga si me desvío menos de 1km,
    para llenar mi camión al 100%.

    Scenario 1: Notificación sonora ante una carga dentro del rango de desvío permitido
        Given una ruta de navegación satelital activa durante el desarrollo de un viaje
        When el sistema detecta una solicitud de carga cuya distancia de desvío es menor al límite permitido
        Then la aplicación emite una alerta acústica para notificar la oportunidad disponible
        And despliega de forma visual la información para optimizar la capacidad del vehículo

        INPUT:
            Ruta de navegación satelital activa
            Nueva solicitud de carga detectada en el mapa
            Distancia de desvío calculada por debajo del límite permitido

        OUTPUT:
            Alerta acústica o sonora emitida en el dispositivo
            Detalle de la oferta de carga desplegado en pantalla

    Scenario 2: Omisión de alerta y restricción visual para cargas fuera del rango de desvío
        Given una ruta de navegación satelital activa hacia el destino del viaje
        When el sistema detecta una solicitud de carga que requiere un desvío mayor al límite permitido
        Then la aplicación evita emitir cualquier alerta sonora de oportunidad de negocio
        And marca el servicio en la lista secundaria como un trayecto fuera de la ruta establecida

        INPUT:
            Ruta de navegación satelital activa
            Nueva solicitud de carga detectada en el mapa
            Distancia de desvío calculada por encima del límite permitido

        OUTPUT:
            Bloqueo de alertas acústicas para el usuario
            Indicador visual estático de carga fuera de ruta en la interfaz
