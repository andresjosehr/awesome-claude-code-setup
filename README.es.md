<p align="center">
<img src="docs/media/howdy.png" alt="Claude Code Power Tools" width="200"/><br />
</p>

<p align="center"><b>
Potencia tu experiencia con Claude Code con comandos ultrarrápidos y flujos de trabajo inteligentes.
</b></p>

<p align="center">
🎯 19 Comandos Slash &bull; ⚡ 17 Herramientas Shell<br />
🧠 Análisis NLP &bull; 🤖 Servidores MCP 💰 50-80% Ahorro de Tokens<br />
📦 TypeScript/JS &bull; 🐍 Python &bull; 🐹 Go &bull; 🦀 Rust<br /><br />
Presentado por<br />
<a href='https://pressw.ai&utm_source=github&utm_medium=readme&utm_campaign=claude-code-power-tools'>
  <img src="docs/media/pressw.png" alt="Claude Code Power Tools" width="100"/>
</a>
</p>

<p align="center">
<img src="https://github.com/cassler/awesome-claude-code-setup/actions/workflows/smoke-test-macos.yml/badge.svg" alt="Tests macOS" />
<img src="https://github.com/cassler/awesome-claude-code-setup/actions/workflows/smoke-test-linux.yml/badge.svg" alt="Tests Linux" />
</p>

## 🪶 ¿Qué es AwesomeClaude?

AwesomeClaude está **basado en las
[Mejores Prácticas de Claude Code de Anthropic](https://www.anthropic.com/engineering/claude-code-best-practices)** -
implementando sus patrones recomendados para reducir el uso de tokens mediante
operaciones agrupadas, mejorando la velocidad al automatizar tareas repetitivas,
asegurando consistencia con flujos de trabajo estandarizados, y manteniendo una
sobrecarga mínima de contexto. **Como un ingeniero experimentado, nos enfocamos
en dominar el entorno en el que Claude trabaja** - no solo agregando más
herramientas, sino construyendo la base correcta. **Agregamos solo ~300 tokens
al contexto de Claude** mientras proporcionamos capacidades de nivel profesional:

- ✅ **Bash Consciente de Tokens** - scripts, automatizaciones y herramientas CLI
  para minimizar el uso de tokens mientras maximizamos el poder.
- ✅ **Análisis de Código con NLP** - análisis estático, calidad de código e
  información de documentación sin dependencias externas.
- ✅ **Agrupación Inteligente** - Mantenemos la lógica de negocio compleja donde
  pertenece: en el código, no en el contexto de Claude.
- ✅ **Mejores Prácticas SDLC** - Proporcionamos flujos de trabajo completos para
  desarrollo de funcionalidades, depuración, testing, documentación, operaciones
  git y despliegue con simples comandos slash.
- ✅ **Integración de Servidores MCP** - Conexión sin problemas a servidores MCP
  de Playwright y Context7 para pruebas visuales y documentación siempre actual.

## 🚀 Instalación Rápida (30 segundos)

```bash
# Instalación en una línea
curl -sSL https://raw.githubusercontent.com/cassler/awesome-claude-code-setup/main/setup.sh | bash && source ~/.zshrc

# O si prefieres revisar primero:
git clone https://github.com/cassler/awesome-claude-code-setup.git && cd awesome-claude-code-setup && ./setup.sh && source ~/.zshrc
```

**¡Eso es todo!** Ahora tienes acceso instantáneo a comandos y flujos de trabajo
poderosos. ¡La instalación maneja todo automáticamente!

- Detecta servidores existentes para evitar duplicados
- Instala solo lo que necesitas
- Funciona a nivel de usuario - disponible en todos los proyectos
- Recurre a instrucciones manuales si es necesario

### 🌍 Instalación en Español

```bash
# Instalación interactiva (pregunta idioma)
./setup.sh

# Instalación directa en español
./setup.sh --lang=es
```

### 📦 ¿Qué se Instala?

1. **Scripts de ayuda** → `~/.claude/scripts/`
2. **Comandos slash** → `~/.claude/commands/`
3. **Alias de shell** → Agregados a tu `.zshrc` o `.bashrc`
4. **Configuración global** → `~/.claude/CLAUDE.md` (auto-actualizado)

## 📝 Comandos Slash - Lo Que Realmente Usarás

Escribe `/` en Claude para acceder a estos flujos de trabajo completos:

### Flujos de Desarrollo

- ✨ `/start-feature` - Crear issue, rama y PR borrador automáticamente
- 🐛 `/debug-issue` - Depuración sistemática con análisis de causa raíz
- ✅ `/pre-review-check` - Asegurar que el código está listo para revisión
- 🚢 `/pre-deploy-check` - Verificación de preparación para producción

### Análisis y Documentación

- 🧠 `/understand-codebase` - Ponerse al día con cualquier proyecto rápidamente
- 📝 `/update-docs` - Mantener la documentación sincronizada con el código
- 📚 `/gather-tech-docs` - Extraer toda la documentación técnica
- 🔍 `/explore-module` - Inmersión profunda en dependencias de módulos
- 📦 `/analyze-dependencies` - Auditoría completa de dependencias
- 🌐 `/api-documenter` - Auto-generar documentación de API
- 🔧 `/refactor-assistant` - Flujo de trabajo sistemático de refactorización

### Testing y Calidad

- 🧪 `/tdd` - Flujo de trabajo de desarrollo guiado por pruebas
- 🎨 `/visual-test` - Pruebas de regresión visual
- 💸 `/tech-debt-hunt` - Encontrar y priorizar deuda técnica
- 🔒 `/security-audit` - Escaneo completo de vulnerabilidades de seguridad
- ⚡ `/performance-check` - Encontrar cuellos de botella de rendimiento

### Proceso y Seguimiento

- 🔄 `/commit-and-push` - Flujo de trabajo git completo con verificaciones de PR
- 📓 `/dev-diary` - Registrar decisiones de desarrollo
- 🚀 `/post-init-onboarding` - Incorporación sistemática al proyecto

## 🎯 Comandos Shell (Cómo Claude Te Ahorra Tokens)

Estos alias son principalmente para que Claude ejecute tareas eficientemente sin
cargar documentación en el contexto, pero también puedes usarlos directamente:

### Atajos Esenciales

- `chp` - **Vista general del proyecto** - Obtén contexto instantáneo sobre cualquier código base
- `chs find-code "patrón"` - **Búsqueda ultrarrápida** usando ripgrep
- `ch` - **Helper principal** - Accede a cualquier herramienta con `ch [categoría] [comando]`

### Categorías de Comandos

| Categoría       | Alias  | Comandos Clave                               | Propósito                      |
| --------------- | ------ | -------------------------------------------- | ------------------------------ |
| **project**     | `p`    | `chp` → vista completa del proyecto          | Análisis instantáneo           |
| **search**      | `s`    | `find-code`, `find-file`, `search-imports`   | Búsqueda ultrarrápida          |
| **git**         | `g`    | `quick-commit`, `pr-ready`, `status`         | Flujos git simplificados       |
| **docker**      | `d`    | `ps`, `logs`, `shell`, `inspect`             | Gestión de contenedores        |
| **typescript**  | `ts`   | `deps`, `build`, `test`, `outdated`          | Herramientas Node.js/TS        |
| **python**      | `py`   | `deps`, `test`, `lint`, `venv`, `audit`      | Kit completo de Python         |
| **go**          | `go`   | `deps`, `test`, `build`, `mod`, `audit`      | Desarrollo Go completo         |
| **context**     | `ctx`  | `for-task`, `mdout`, `mdfm`, `mdh`           | Generación inteligente         |
| **multi**       | `m`    | `read-many`, `read-pattern`                  | Operaciones por lotes          |
| **api**         | -      | `test`, `watch`, `benchmark`                 | Testing y monitoreo de API     |
| **interactive** | `i`    | `select-file`, `select-branch`               | Selecciones interactivas       |
| **nlp**         | `text` | `tokens`, `complexity`, `security`, `smells` | 🧠 Análisis de código con IA   |

> 💡 **Uso:** `ch [categoría] [comando]` o usa atajos como `chp`, `chs` 📚
> **Docs completas:** Ejecuta `ch [categoría] help` para ver todos los comandos

## 🧠 NLP y Análisis de Código - Tu Revisión de Código con IA

**¡Análisis estático poderoso sin dependencias externas!** Nuestro kit NLP usa
solo la biblioteca estándar de Python para proporcionar:

### 📊 Gestión de Tokens

- **`ch nlp tokens archivo.py`** - Conoce el costo antes de leer archivos
- **Agrupación inteligente** - Verifica múltiples archivos: `ch nlp tokens src/*.js`
- **Previene sobrecarga de contexto** - Nunca cargues archivos masivos accidentalmente

### 🔍 Análisis de Calidad de Código

- **`ch nlp complexity archivo.py`** - Puntuación de complejidad ciclomática
- **`ch nlp security codigo.py`** - Encuentra inyección SQL, secretos hardcodeados, operaciones inseguras
- **`ch nlp smells codigo.py`** - Detecta funciones largas, anidamiento profundo, números mágicos
- **`ch nlp duplicates src/ 5`** - Encuentra bloques de código duplicado (5+ líneas)
- **`ch nlp docs modulo.py`** - Análisis de cobertura de documentación

### 📝 Procesamiento de Texto

- **`ch nlp summary README.md`** - Extrae puntos clave de documentación
- **`ch nlp keywords articulo.md 20`** - Extrae las principales palabras clave
- **`ch nlp readability docs.md`** - Calcula puntuaciones de legibilidad
- **`ch nlp sentiment "texto de reseña"`** - Analiza sentimiento del texto

### 🎯 Un Comando, Análisis Completo

```bash
ch nlp overview app.py
```

¡Devuelve todo: puntuaciones de complejidad, problemas de seguridad, code smells,
cobertura de documentación y sugerencias de mejora - todo en una salida estructurada!

## 💡 ¿Por Qué Usar Esto?

### Comparación de Uso de Tokens

| Enfoque              | Tokens de Contexto     | Ejemplo                                    |
| -------------------- | ---------------------- | ------------------------------------------ |
| **Otras herramientas** | 5,000-15,000 tokens  | Documentación completa cargada en contexto |
| **Trabajo manual**   | 1,000+ tokens por tarea | Múltiples lecturas de archivos, comandos repetidos |
| **Claude Helpers**   | **~300 tokens total**  | Config mínima + scripts de entorno         |

### Sin estas herramientas:

- Claude hace múltiples llamadas para recopilar info del proyecto
- Escribes comandos largos repetidamente
- El uso de tokens se acumula rápidamente
- Los flujos de trabajo varían entre sesiones

### Con estas herramientas:

- Un comando (`chp`) = contexto completo del proyecto
- Atajos para todo (`chs find-code "patrón"`)
- Operaciones agrupadas ahorran 50-80% en tokens
- Análisis con IA (`ch nlp overview archivo.py` = complejidad + seguridad + calidad)
- Consciencia de tokens (`ch nlp tokens` antes de leer archivos grandes)
- Flujos de trabajo consistentes y reproducibles
- **Tu contexto permanece limpio para el trabajo real**

## 🔧 Herramientas Requeridas y Opcionales

### Requeridas

- **ripgrep** - Búsqueda rápida de archivos (search-tools.sh)
- **jq** - Procesamiento JSON (project-info.sh, ts-helper.sh, api-helper.sh)

### Mejoras Opcionales

- **fzf** - Buscador fuzzy interactivo
- **bat** - Resaltado de sintaxis
- **gum** - Prompts CLI elegantes
- **delta** - Diffs de git mejorados
- **httpie** - Cliente HTTP mejorado

El script de instalación ofrecerá instalar las herramientas faltantes automáticamente.

## 🛠️ Personalización

### Agregar Nuevos Scripts

1. Crea el script en `scripts/mi-helper.sh`
2. Ejecuta `./setup.sh` para instalar
3. Accede vía `ch mihelper` o agrégalo al helper principal

### Agregar Nuevos Comandos

1. Crea un markdown en `commands/mi-comando.md`
2. Ejecuta `./setup.sh` para instalar
3. Úsalo en Claude como `/mi-comando`

## 🤝 Contribuir

1. Haz fork del repositorio
2. Agrega tus scripts/comandos
3. Envía un pull request
4. ¡Comparte tus mejoras!

## 📄 Licencia

Licencia MIT - ver archivo LICENSE para detalles
