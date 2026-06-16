Feature: Notificación de retraso
    Como transportista,
    quiero enviar una alerta masiva de tráfico o clima,
    para que los productores no esperen en vano.

    Scenario 1: Envío masivo de notificación push ante un incidente vial
        Given un incidente de fuerza mayor reportado en la vía de transporte
        When registro un tiempo estimado de demora en el sistema
        Then la plataforma despacha de forma automática una notificación push a los destinatarios vinculados

        INPUT:
            Estado de incidente en la vía detectado
            Tiempo estimado de retraso ingresado por el transportista

        OUTPUT:
            Envío masivo de alertas push activado
            Notificación distribuida a todos los dueños de la carga

    Scenario 2: Visualización del detalle del retraso por parte del cliente
        Given que un cliente ha recibido una alerta de retraso en su dispositivo móvil
        When abre la aplicación para revisar el estado del servicio
        Then visualiza la causa principal que originó la demora en el trayecto
        And el sistema despliega el nuevo horario estimado de llegada actualizado

        INPUT:
            Notificación previa recibida en el dispositivo
            Acción de abrir la interfaz de la aplicación

        OUTPUT:
            Detalle o motivo del retraso visible en pantalla
            Nueva hora estimada de arribo calculada y desplegada
