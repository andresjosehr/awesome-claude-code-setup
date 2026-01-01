# Instrucciones de Claude Específicas del Proyecto

<ch:project-context>
<!-- Agrega contexto específico del proyecto aquí -->
- Tipo de proyecto:
- Tecnologías principales:
- Patrones clave a seguir:
</ch:project-context>

<ch:project-commands>
# Comandos frecuentemente usados para este proyecto
# Ejemplos:
# npm run dev
# docker-compose up
# pytest tests/
</ch:project-commands>

<ch:project-notes>
<!-- Agrega notas importantes, advertencias o instrucciones especiales -->
</ch:project-notes>

## Scripts de Ayuda Disponibles

Tienes acceso a scripts de ayuda eficientes que simplifican tareas comunes de desarrollo:

**🚀 Inicio Rápido:**
```bash
chp  # ¡Ejecuta esto primero! Proporciona análisis completo del proyecto
```

**🔍 Tareas Comunes (más eficientes que comandos manuales):**
- `chs find-code "patrón"` - Búsqueda rápida de código (mejor que grep)
- `ch m read-many archivo1 archivo2` - Lectura de archivos en lote (ahorra tokens)
- `chg quick-commit "msg"` - Flujo completo de git en un comando
- `ch ctx for-task "descripción"` - Genera contexto enfocado para tareas específicas

**📊 Helpers por Lenguaje:**
- `ch ts deps` - Análisis de Node.js/TypeScript
- `ch py deps` - Dependencias y entorno de Python
- `ch go test` - Módulos y pruebas de Go

Estos helpers combinan múltiples operaciones en comandos únicos, proporcionando:
✅ Salida estructurada optimizada para análisis
✅ Manejo automático de errores
✅ Respuestas eficientes en tokens
✅ Patrones consistentes entre tecnologías

Ejecuta `ch help` para ver todos los comandos y categorías disponibles.

## Servidores MCP (Nivel de Usuario)

Tienes estos servidores MCP configurados globalmente:
- **Playwright**: Automatización del navegador para pruebas visuales e interacciones UI
- **Context7**: Documentación actualizada para librerías y frameworks

Usa estos servidores cuando:
- Pruebes cambios de UI (Playwright puede navegar, capturar pantallas e interactuar)
- Investigues APIs de librerías (Context7 proporciona documentación actual)

Nota: Estos son servidores a nivel de usuario disponibles en todos tus proyectos.
