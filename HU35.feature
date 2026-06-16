Feature: Foto de ticket balanza
    Como transportista,
    deseo subir la foto del pesaje oficial,
    para evitar reclamos sobre el monto del flete compartido.

    Scenario 1: Recálculo automático de tarifas basado en pesaje real verificado
        Given un pesaje oficial realizado de manera física en el mercado de destino
        When subo la imagen digital del ticket oficial que contrasta el peso real frente al estimado
        Then el sistema actualiza automáticamente los valores monetarios finales para el cobro
        And distribuye los costos del flete compartido según el metraje o tonelaje real registrado

        INPUT:
            Estado de pesaje concluido en destino
            Imagen clara del ticket de balanza oficial con datos legibles

        OUTPUT:
            Valores de cobro recalculados en el sistema
            Distribución actualizada del flete compartido basada en el peso real

    Scenario 2: Rechazo de imagen por deficiencias de lectura u opacidad
        Given el acceso activo a la cámara o galería del dispositivo del transportista
        When subo una captura fotográfica defectuosa o borrosa donde no se distinguen los datos del peso
        Then el sistema invalida el archivo cargado para evitar errores de procesamiento
        And despliega una advertencia en la pantalla solicitando una captura con mejor resolución

        INPUT:
            Módulo de carga de archivos multimedia activo
            Archivo de imagen borroso, opaco o ilegible

        OUTPUT:
            Rechazo de la carga del archivo en la plataforma
            Mensaje de advertencia o instrucción de reintento visible en la interfaz
