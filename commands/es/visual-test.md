# Pruebas Visuales con Playwright

Usa Playwright para probar visualmente tus cambios recientes de UI.

## Integracion con Servidor MCP

Si tienes el servidor MCP de Playwright configurado (via .mcp.json), Claude Code puede:
- Navegar a tu app y tomar capturas de pantalla
- Interactuar con elementos directamente
- Generar codigo de pruebas Playwright
- Ejecutar comparaciones visuales

Para usar: Simplemente describe lo que quieres probar y Claude Code usara el servidor MCP de Playwright si esta disponible.

## Tareas de Prueba

1. **Identificar que probar**
   - Listar todos los componentes de UI que has modificado
   - Anotar cualquier nuevo flujo de usuario o interaccion
   - Considerar puntos de quiebre de diseno responsivo

2. **Ejecutar pruebas visuales**
   - Usar las capacidades de captura de pantalla de Playwright
   - Probar en multiples navegadores (Chromium, Firefox, WebKit)
   - Capturar diferentes estados (cargando, error, exito)
   - Probar modos claro y oscuro si aplica

3. **Pruebas de interaccion**
   - Hacer clic a traves de flujos de usuario
   - Probar envios de formularios
   - Verificar animaciones y transiciones
   - Comprobar estados hover e indicadores de foco

4. **Verificaciones de accesibilidad**
   - Verificar que la navegacion por teclado funciona
   - Probar con anuncios de lector de pantalla
   - Comprobar ratios de contraste de color
   - Asegurar etiquetas ARIA apropiadas

5. **Validacion entre navegadores**
   - Comparar renderizado entre navegadores
   - Probar en diferentes tamanos de viewport
   - Verificar comportamiento consistente

## Comandos a usar

Revisa los scripts de prueba y documentacion de tu proyecto. Patrones comunes incluyen:

```bash
# Ejemplos - adaptar a la configuracion de tu proyecto:
# npm run test:visual
# yarn test:e2e
# pnpm test:playwright
# python -m pytest tests/visual
# bundle exec rspec spec/features
# ./gradlew test

# Para Playwright especificamente (si lo usas):
# npx playwright test --update-snapshots
# playwright test --ui
```

## Que buscar

- Cambios de layout o disenos rotos
- Estilos faltantes o colores incorrectos
- Elementos superpuestos
- Texto cortado o con saltos de linea incorrectos
- Elementos interactivos que no responden
- Estados de carga que se quedan atascados
- Mensajes de error que no se muestran correctamente

Recuerda hacer commit de cualquier archivo de snapshot nuevo o actualizado si los cambios visuales son intencionales!
