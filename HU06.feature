Feature: Cierre de sesión seguro
  Como usuario de AgroDirecto
  Deseo cerrar mi sesión
  Para proteger mi información en dispositivos compartidos o cabinas públicas

  Scenario: Cierre exitoso de sesión
    Given que el usuario tiene una sesión activa en la aplicación
    When accede al menú principal
    And pulsa el botón "Cerrar sesión"
    Then el sistema limpia las credenciales de la memoria
    And elimina tokens de autenticación
    And redirige a la pantalla de login
    And muestra: "Sesión cerrada correctamente"

  Scenario: Protección al intentar volver después de cerrar sesión
    Given que un usuario ya ha cerrado su sesión
    When intenta regresar usando el botón "Atrás" del dispositivo
    Then el sistema lo mantiene en la pantalla de login
    And no permite acceder a secciones privadas
    And muestra: "Debes iniciar sesión para continuar"
