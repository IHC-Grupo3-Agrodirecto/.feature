Feature: Verificación de perfil de usuario
  Como usuario de AgroDirecto
  Quiero visualizar el sello de "Perfil Verificado"
  Para confiar en la identidad y reputación de mi contraparte

  Scenario: Visualización de sello de confianza en perfil verificado
    Given que el usuario navega por las ofertas disponibles
    When hace clic en el perfil de un transportista o productor
    Then ve el sello de confianza (check verde) de AgroDirecto
    And aparece la información: "Perfil Verificado - Identidad confirmada"
    And visualiza la fecha de verificación: "Verificado el 15 de abril de 2025"

  Scenario: Advertencia en perfil no verificado
    Given que un usuario consulta el perfil de otro
    And ese perfil aún no ha sido verificado
    When abre la tarjeta de perfil
    Then el sistema no muestra el check de verificado
    And aparece un mensaje: "Perfil en proceso de validación"
    And se sugiere: "Este perfil aún no ha sido verificado. Actúa con precaución"