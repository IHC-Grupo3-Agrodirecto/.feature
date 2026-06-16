Feature: Reportar abuso
    Como usuario
    quiero denunciar si un transportista intenta cobrar por fuera de la app
    para mantener la transparencia

    Scenario 1: Inicio de investigación por mala conducta del transportista
        Given una mala conducta del transportista por intento de cobro fuera de la aplicación
        When envío el reporte adjuntando una captura de pantalla como evidencia
        Then el equipo de AgroDirecto inicia el proceso de investigación para el bloqueo

        INPUT:
            Evidencia de mala conducta (captura de pantalla)
            Acción de enviar el reporte de cobro externo

        OUTPUT:
            Registro de la denuncia en el sistema
            Inicio del proceso de investigación de bloqueo

    Scenario 2: Confirmación del envío anónimo del formulario de denuncia
        Given un productor que decide reportar un abuso en la plataforma
        When envía el formulario de denuncia completado
        Then el sistema muestra un mensaje de confirmación sobre el envío anónimo
        And agradece al usuario por colaborar con la transparencia de la aplicación

        INPUT:
            Formulario de denuncia completado
            Acción de enviar el formulario

        OUTPUT:
            Mensaje de confirmación en pantalla
            Estado de anonimato garantizado en el reporte
