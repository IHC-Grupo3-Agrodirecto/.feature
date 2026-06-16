Feature: Calificación mutua
    Como usuario
    deseo calificar la puntualidad y trato de mi contraparte
    para construir una red de confianza rural

    Scenario 1: Actualización de la reputación pública por puntualidad
        Given un viaje finalizado en la plataforma
        When selecciono un nivel de puntuación para el transportista basado en su puntualidad
        Then el sistema actualiza la reputación pública del usuario con el nuevo promedio calculado

        INPUT:
            Estado del viaje (finalizado)
            Puntuación de puntualidad seleccionada

        OUTPUT:
            Reputación pública del usuario actualizada
            Nuevo promedio de calificación guardado

    Scenario 2: Almacenamiento de calificación asíncrona o pendiente de contraparte
        Given un viaje completado por ambas partes
        When el productor califica al transportista pero el transportista aún no califica al productor
        Then la calificación realizada por el productor se guarda correctamente en la base de datos
        And el sistema marca el estado de la calificación mutua como pendiente por parte del transportista

        INPUT:
            Estado del viaje (completado)
            Registro de calificación del productor enviado
            Estado ausente de calificación del transportista

        OUTPUT:
            Calificación del productor almacenada con éxito
            Estado del registro marcado como pendiente de contraparte
