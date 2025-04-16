# Portfolio Domain Libraries

This directory contains the library code for the portfolio application, organized using domain-driven design principles.

## Structure

```
libs/
└── domain/
    └── [domain-name]/
        ├── feature/  # Feature libraries (smart components)
        │   ├── [feature-name]/
        │   ├── [feature-name]/
        │   └── [feature-name]/
        │
        └── ui/  # UI libraries (dumb components)
            ├── components/
            └── layout/
```

## Library Types

### Feature Libraries (`feature/*`)
Feature libraries contain business logic and smart components. These are specific to the portfolio domain and implement actual features.
- Handle data fetching
- Manage state
- Contain business logic
- Coordinate UI components
- Handle user interactions
- Implement routing logic

Each feature library contains:
- `components/` - Feature-specific smart components
- `hooks/` - Custom hooks for the feature
- `services/` - API calls and business logic
- Main feature component

Current feature libraries:
- `about` - About page and personal information
- `projects` - Project showcase and portfolio items
- `contact` - Contact form and information

### UI Libraries (`ui/*`)
UI libraries contain reusable, presentational components with no business logic.
- Accept props for all data
- Be purely presentational
- Have no side effects
- Be highly reusable
- Handle no business logic
- Be thoroughly tested for visual consistency

Current UI libraries:
- `components/` - Reusable UI components (buttons, cards, etc.)
- `layout/` - Layout components (header, footer, sidebar)

## Usage Guidelines

### Creating New Libraries

```bash
# Create a new feature library
nx g @nx/react:library --name=feature-[name] --directory=domain/portfolio/feature/[name]

# Create a new UI library
nx g @nx/react:library --name=ui-[name] --directory=domain/portfolio/ui/[name]
```

### Best Practices

1. **Dependencies**
   - Feature libraries can depend on UI libraries
   - UI libraries should not depend on feature libraries
   - Avoid circular dependencies

2. **Component Guidelines**
   - UI components should be pure and presentational
   - Feature components can contain business logic and state
   - Use TypeScript for better type safety

3. **Exports**
   - Use barrel files (index.ts) for clean exports
   - Export only what's necessary
   - Document public APIs

4. **Testing**
   - UI components: Focus on visual regression and interaction tests
   - Feature components: Focus on business logic and integration tests

## Contributing

When adding new libraries:
1. Follow the existing structure
2. Update this README if adding new library types
3. Ensure proper documentation within each library
4. Add appropriate test coverage


## Nx Folder Structure

Commands:
npx nx g @nx/next:lib \
  --name=feature-portfolio-experience \
  --directory=libs/domain/portfolio/feature/experience \
  --importPath=@libs/portfolio/experience \
  --tags=scope:domain,type:feature \
  --style=scss \
  --dry-run

npx nx g @nx/react:lib \
  --name=ui-portfolio \
  --directory=libs/domain/portfolio/ui/components \
  --importPath=@libs/portfolio/ui/components \
  --component=false \
  --tags=scope:domain,type:ui \
  --bundler=vite \
  --style=scss \
  --dry-run

npx nx g @nx/react:component ui-porfolio-button \
  --path=libs/domain/portfolio/ui/components/src/lib/button \
  --name=ui-porfolio-button \
  --export \
  --style=scss \
  --dry-run

Type which defines "What is in this library”. eg. type:foo
types:
- feature, dependsOn: any
- ui, dependsOn: ui, util
- data-access, dependsOn: data-access, util
- util

Scope which defines "Where a library lives", "What visibility a library has", “who owns it”. eg. scope:foo
scopes:
- domain, dependsOn: shared
- slice, dependsOn: domain/slice, shared
- shared, dependsOn: shared
- state
- storybook*

*: optional

