# Sandcastle Engine

A Godot game project structured for developers with Python/SQL backgrounds, emphasizing clean separation of concerns and resource-based architecture.

## Project Philosophy

This project uses a **Resource-Based System** where game data (cards, items, etc.) are treated like database tables:
- **Resources** = Database rows (individual `.tres` files)
- **Scripts in `/resources/scripts`** = Table schemas (defining columns/properties)
- **Scenes** = Views/Components (visual templates)
- **Scripts in `/scripts`** = Business logic (controllers)

## Folder Structure

```
sandcastle-engine/
├── assets/              # Raw binary data (external files)
│   ├── art/            # PNGs, spritesheets, background textures
│   ├── audio/          # SFX (WAV) and music (OGG)
│   └── fonts/          # TTF/OTF font files
│
├── resources/           # Game database (data-driven content)
│   ├── cards/          # Individual card data files (fireball.tres, shield.tres)
│   └── scripts/        # Resource schemas (card_data.gd defines card properties)
│
├── scenes/              # Visual templates (UI/Component layer)
│   ├── entities/       # Global objects (player.tscn, enemy.tscn)
│   ├── ui/             # Interface elements (card_ui.tscn, health_bar.tscn)
│   └── maps/           # Levels and exploration zones (tutorial_level.tscn)
│
└── scripts/             # Source code (business logic)
    ├── entities/       # Movement and behavior logic (player.gd)
    ├── ui/             # UI update logic (card_ui.gd)
    └── autoload/       # Global singletons (GameManager.gd, Database.gd)
```

## Why This Structure Works

### For Python/SQL Developers

**Clean Imports**
```gdscript
# Predictable, semantic paths
var PlayerScript = load("res://scripts/entities/player.gd")
var CardData = load("res://resources/scripts/card_data.gd")
var FireballCard = load("res://resources/cards/fireball.tres")
```

**Git Optimization**
- Track logic changes (`/scripts`) separately from layout changes (`/scenes`)
- Can ignore large asset folders if needed
- Clear separation makes code reviews easier

**Scalability**
- **Phase 1 (Setup)**: Create the base schemas and templates
- **Phase 2 (Logic)**: Build the systems in `/scripts`
- **Phase 3 (Content)**: Just add `.tres` files to `/resources/cards`
- No need to touch UI code when adding new content

## Getting Started

### 1. Setting Up Resource Schemas

Create your "table definitions" in `/resources/scripts`:

```gdscript
# resources/scripts/card_data.gd
extends Resource
class_name CardData

@export var card_name: String
@export var cost: int
@export var description: String
@export var icon: Texture2D
```

### 2. Creating Data Instances

In Godot Editor:
1. Right-click `/resources/cards` → New Resource
2. Select `CardData` as the type
3. Fill in the properties
4. Save as `fireball.tres`

### 3. Building Templates

Create reusable scenes in `/scenes/ui`:
- `card_ui.tscn` - Visual representation of any card
- Attach logic from `/scripts/ui/card_ui.gd`
- The script loads data and updates the display

### 4. Global Management

Use `/scripts/autoload` for cross-scene systems:
- `GameManager.gd` - Game state, turn management
- `Database.gd` - Load and cache all card resources
- Configure in Project Settings → Autoload

## Workflow Example: Adding a New Card

1. **Create the data** (no code needed):
   - Right-click `/resources/cards` → New Resource → CardData
   - Set name: "Ice Bolt", cost: 2, description: "Freeze enemy"
   - Save as `ice_bolt.tres`

2. **It just works**:
   - Your existing `card_ui.tscn` will display it
   - Your `Database.gd` will load it automatically
   - No scene modifications required

## Best Practices

### Naming Conventions
- **Files**: `snake_case.gd`, `snake_case.tscn`, `snake_case.tres`
- **Classes**: `PascalCase` (class_name CardData)
- **Variables**: `snake_case` (var card_name)

### Resource Organization
- One resource file per entity (1 card = 1 `.tres` file)
- Group similar resources in subfolders when you hit 20+ files
- Use descriptive names: `fireball.tres` not `card_001.tres`

### Script Organization
- Keep entity logic with entities (`/scripts/entities`)
- Keep UI logic with UI (`/scripts/ui`)
- Only use autoload for truly global systems (avoid singleton abuse)

### Scene Organization
- Scenes are templates, not instances
- Keep scenes focused (one responsibility per scene)
- Compose complex objects from smaller scenes

## Development Phases

### Phase 1: Foundation
- [ ] Create resource schemas (`/resources/scripts`)
- [ ] Build base scenes (`/scenes/ui`, `/scenes/entities`)
- [ ] Set up autoload singletons (`/scripts/autoload`)

### Phase 2: Systems
- [ ] Implement game logic (`/scripts/entities`, `/scripts/ui`)
- [ ] Connect data to display (resources → scenes)
- [ ] Build core gameplay loop

### Phase 3: Content
- [ ] Create card resources (`.tres` files)
- [ ] Add art assets (`/assets/art`)
- [ ] Add audio (`/assets/audio`)
- [ ] Build levels (`/scenes/maps`)

## Tech Stack

- **Engine**: Godot 4.x
- **Language**: GDScript
- **Version Control**: Git
- **Asset Formats**:
  - Images: PNG
  - Audio: WAV (SFX), OGG (Music)
  - Fonts: TTF/OTF

## Resources

- [Godot Documentation](https://docs.godotengine.org/)
- [GDScript Reference](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/index.html)
- [Resource System Guide](https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html)

## License

[Add your license here]

## Contributors

[Add contributors here]
