Feature: Comentarios de servicio
    Como productor
    deseo escribir una reseña sobre el estado en que llegó mi carga
    para recomendar al transportista a otros

    Scenario 1: Publicación exitosa de una reseña de viaje por parte del productor
        Given que ha finalizado un viaje y se ha completado la calificación numérica previa
        When redacto mi opinión detallando las condiciones de recepción de la carga
        Then el sistema publica el comentario en el muro público del perfil del transportista

        INPUT:
            Estado post-viaje finalizado
            Calificación numérica asignada
            Texto de la reseña redactado

        OUTPUT:
            Publicación visible en el perfil del transportista

    Scenario 2: Respuesta del transportista a un comentario recibido
        Given un comentario publicado por un productor en el perfil de un transportista
        When el transportista escribe una respuesta de agradecimiento u observación
        Then el sistema muestra la respuesta de manera jerárquica debajo del comentario original

        INPUT:
            Comentario existente del productor
            Texto de respuesta del transportista

        OUTPUT:
            Respuesta enlazada y visible debajo del comentario original
