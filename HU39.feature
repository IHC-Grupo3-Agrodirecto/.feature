Feature: Botón de auxilio SOS
    Como transportista
    deseo activar una alerta de peligro
    para recibir ayuda de la central en caso de robo o accidente

    Scenario 1: Despacho automático de coordenadas ante una emergencia activa
        Given una situación crítica de peligro durante el desarrollo del trayecto
        When presiono el botón de auxilio integrado en la interfaz de la aplicación
        Then el sistema transmite de manera automática las coordenadas geográficas exactas del usuario
        And distribuye la notificación de emergencia al centro de soporte y a los organismos pertinentes

        INPUT:
            Estado de peligro en ruta activo
            Acción de presionar el botón "SOS" en la pantalla

        OUTPUT:
            Envío inmediato de la ubicación GPS exacta
            Notificación de emergencia distribuida a soporte y autoridades

    Scenario 2: Confirmación y retroalimentación de asistencia en camino
        Given un reporte de auxilio enviado correctamente desde la aplicación
        When el centro de operaciones recibe y procesa la notificación de emergencia
        Then el transportista recibe una confirmación visual en su dispositivo móvil
        And el sistema muestra instrucciones de seguridad mientras se coordina la asistencia presencial

        INPUT:
            Reporte de auxilio registrado previamente
            Recepción y procesamiento de la alerta por soporte

        OUTPUT:
            Confirmación de asistencia recibida en el dispositivo móvil
            Instrucciones de seguridad desplegadas en la interfaz del usuario
