const nx = require('@nx/eslint-plugin');
const eslintConfigPrettier = require('eslint-config-prettier');
const eslint = require('@eslint/js');
const tseslint = require('typescript-eslint');

module.exports = [
  ...nx.configs['flat/base'],
  ...nx.configs['flat/typescript'],
  ...nx.configs['flat/javascript'],
  ...tseslint.config(
    eslint.configs.recommended,
    ...tseslint.configs.recommended,
  ),
  eslintConfigPrettier,
  {
    ignores: ['**/dist'],
  },
  {
    files: ['**/*.ts', '**/*.tsx', '**/*.js', '**/*.jsx'],
    rules: {
      '@nx/enforce-module-boundaries': [
        'error',
        {
          enforceBuildableLibDependency: true,
          allow: ['^.*/eslint(\\.base)?\\.config\\.[cm]?js$'],
          depConstraints: [
            {
              sourceTag: "type:app",
              onlyDependOnLibsWithTags: [
                "type:feature",
                "type:ui",
                "type:data-access",
                "type:util"
              ]
            },
            {
              sourceTag: "type:feature",
              onlyDependOnLibsWithTags: [
                "type:feature",
                "type:ui",
                "type:data-access",
                "type:util"
              ]
            },
            {
              sourceTag: "type:ui",
              onlyDependOnLibsWithTags: ["type:ui", "type:util"]
            },
            {
              sourceTag: "type:data-access",
              onlyDependOnLibsWithTags: ["type:data-access", "type:util"]
            },
            {
              sourceTag: "type:util",
              onlyDependOnLibsWithTags: ["type:util"]
            },
            // {
            //   sourceTag: "scope:domain",
            //   onlyDependOnLibsWithTags: ["scope:shared", "scope:domain"]
            // },
            {
              sourceTag: "scope:portfolio",
              onlyDependOnLibsWithTags: ["scope:shared", "scope:portfolio"]
            },
            // {
            //   sourceTag: "scope:slice",
            //   onlyDependOnLibsWithTags: ["scope:domain", "scope:slice", "scope:shared"]
            // },
            {
              sourceTag: "scope:shared",
              onlyDependOnLibsWithTags: ["scope:shared"]
            },
            {
              sourceTag: "scope:state",
              notDependOnLibsWithTags: ["*"]
            }
          ],
        },
      ],
    },
  },
  {
    files: ['**/*.config.js'],
    rules: {
      '@typescript-eslint/no-require-imports': 'off',
    },
  },
  {
    files: ['**/*.ts', '**/*.tsx', '**/*.js', '**/*.jsx'],
    // Override or add rules here
    rules: {},
  },
];
