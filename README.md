# Configuração Pessoal do Neovim

Configuração personalizada do Neovim baseada no [NvChad](https://nvchad.com/), desenvolvida para atender às minhas necessidades diárias de desenvolvimento.

O objetivo é manter um ambiente de desenvolvimento simples, modular e funcional, com suporte a diferentes linguagens e ferramentas, incluindo desenvolvimento de sistemas embarcados com PlatformIO.

## Requisitos

- [Neovim](https://neovim.io/)
- [NvChad](https://nvchad.com/) e seus respectivos pré-requisitos.
- [PlatformIO Core](https://platformio.org/) instalado globalmente (`pio`).

## Estrutura do Projeto

```text
.
├── LICENSE
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── autocmds.lua
    ├── chadrc.lua
    ├── commands.lua
    ├── configs
    │   ├── conform.lua
    │   ├── lazy.lua
    │   ├── lspconfig.lua
    │   ├── mason.lua
    │   ├── platformio.lua
    │   └── treesitter.lua
    ├── mappings.lua
    ├── options.lua
    └── plugins
        └── init.lua
```

### Organização

- `init.lua`: ponto de entrada da configuração.
- `chadrc.lua`: personalizações do NvChad.
- `autocmds.lua`: comandos automáticos.
- `mappings.lua`: atalhos de teclado.
- `options.lua`: opções gerais do Neovim.
- `commands.lua`: definição de comandos personalizados (User Commands) para automatizar tarefas no Neovim.
- `configs/`: configurações de plugins, LSP, formatadores e PlatformIO.
- `plugins/init.lua`: declaração dos plugins utilizados.
- `lazy-lock.json`: versões fixadas dos plugins.

## PlatformIO e Clangd

Para utilizar o `clangd` corretamente em projetos PlatformIO, gere o banco de dados de compilação na raiz do projeto:

```bash
pio run -t compiledb
```

Isso gera o arquivo `compile_commands.json`, permitindo que o clangd reconheça corretamente as configurações de compilação e as dependências do projeto.

### Tratamento de falsos positivos

Algumas flags específicas do toolchain podem gerar diagnósticos incorretos no clangd. Para contornar esse problema, crie um arquivo `.clangd` na raiz do projeto:

```yaml
CompileFlags:
  Remove:
    - -mlongcalls
    - -mtext-section-literals
    - -fipa-pta
    - -free
```

Ou utilize o seguinte comando dentro do próprio Neovim:

```vim
:PioClangd
```

O comando cria automaticamente o arquivo `.clangd` na raiz do projeto, com as configurações necessárias para evitar diagnósticos incorretos do clangd.

## Outras Linguagens

O ambiente também oferece suporte a outras linguagens por meio dos servidores LSP configurados em `lua/configs/lspconfig.lua`, sem exigir configurações específicas para cada projeto, desde que os servidores e suas dependências estejam instalados.

---

**Projeto de uso pessoal**, baseado no NvChad e adaptado ao meu fluxo de desenvolvimento.
