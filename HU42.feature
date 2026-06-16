Feature: Alertas climáticas
    Como usuario
    deseo recibir avisos de lluvia o derrumbes en mi ruta
    para decidir si retraso mi envío de carga perecible

    Scenario 1: Despliegue de aviso preventivo por incidente en la vía
        Given una ruta de transporte activa hacia el punto de destino
        When se emite una notificación oficial de alerta por obstrucción o peligro en la vía
        Then aparece un elemento visual preventivo sobre el mapa de la aplicación
        And el sistema detalla la información del incidente para conocimiento del usuario

        INPUT:
            Ruta de transporte activa
            Notificación oficial de alerta meteorológica o vial

        OUTPUT:
            Elemento visual preventivo (banner) en el mapa
            Detalle técnico del incidente visible en la interfaz

    Scenario 2: Reprogramación de despacho sin recargos por condiciones adversas
        Given un productor con un cargamento perecible listo para ser despachado
        When recibe una alerta de condiciones meteorológicas severas en su trayecto asignado
        Then el sistema habilita la opción para postergar el despacho de la mercancía
        And permite seleccionar un nuevo día para el servicio libre de penalidades financieras

        INPUT:
            Cargamento perecible listo para despacho
            Alerta de clima severo en la ruta asignada
            Acción de postergar el servicio

        OUTPUT:
            Opción de aplazamiento habilitada en pantalla
            Calendario para asignación de nueva fecha
            Exoneración de penalidades confirmada en el sistema
