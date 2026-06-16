Feature: Carga de fotos de vehículo de transportista
  Como transportista
  Deseo subir fotos de mi camión y tolva
  Para que el productor pueda verificar mi capacidad de carga visualmente

  Scenario Outline: Subida exitosa de fotos del vehículo
    Given que el transportista accede a la sección "Editar perfil"
    When sube imágenes reales de su camión en los siguientes ángulos:
      | Ángulo                | Formato            |
      | <angulo>              | <formato>          |
    And presiona "Guardar fotos"
    Then las imágenes aparecen en su perfil
    And son visibles en todas sus ofertas de transporte
    And aparece badge: "Perfil con fotos verificadas"

    Examples:
      | angulo                | formato            |
      | Vista frontal         | JPG                |
      | Vista lateral         | JPG                |
      | Vista trasera         | JPG                |
      | Interior de tolva      | PNG                |

  Scenario: Rechazo de formato de imagen no soportado
    Given que el transportista está en la sección de fotos del vehículo
    When intenta subir un archivo en formato BMP o GIF
    And presiona "Cargar imagen"
    Then el sistema muestra: "Formato no soportado. Usa JPG o PNG"
    And rechaza la carga
    And guía: "Convierte tu imagen a JPG o PNG"