Feature: Seguimiento en vivo
    Como productor,
    deseo ver el camión moviéndose en el mapa,
    para estar tranquilo sobre el estado de mi mercadería.

    Scenario 1: Visualización del movimiento del vehículo en tiempo real
        Given una carga asociada a mi cuenta que se encuentra en estado de tránsito
        When abro la interfaz de seguimiento de la aplicación
        Then veo la representación gráfica del vehículo desplazándose sobre el mapa interactivo
        And el sistema actualiza la posición geográfica en tiempo real

        INPUT:
            Carga en estado de tránsito activa
            Acción de ingresar a la sección de seguimiento

        OUTPUT:
            Mapa interactivo cargado en pantalla
            Icono del vehículo con movimiento basado en telemetría activa

    Scenario 2: Cálculo y despliegue del tiempo estimado de arribo
        Given un vehículo de transporte en ruta hacia el punto de entrega final
        When el productor inspecciona la pantalla de monitoreo geográfico
        Then el sistema calcula de forma dinámica el tiempo restante para la llegada
        And muestra una etiqueta informativa con la estimación de arribo actualizada

        INPUT:
            Vehículo en movimiento a una distancia determinada del destino
            Visualización activa de la pantalla de seguimiento

        OUTPUT:
            Cálculo automatizado de la duración restante del trayecto
            Mensaje con el tiempo estimado de llegada en la interfaz
