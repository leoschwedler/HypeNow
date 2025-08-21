# 🎉 PartyRadar

## 📌 Descrição
O **PartyRadar** é um aplicativo móvel que ajuda os usuários a descobrir festas e eventos próximos que estão **bombando** em tempo real.  
Com ele, é possível visualizar o movimento das festas, ler comentários de outros usuários e planejar seus rolês de forma eficiente. 🚀

---

## ✨ Funcionalidades
- 📍 Visualizar festas e eventos próximos.  
- 🔥 Verificar quais estão mais animadas.  
- 💬 Comentários e avaliações de outros usuários.  
- ⭐ Salvar eventos favoritos localmente.

---

## 🛠 Tecnologias
O aplicativo será desenvolvido utilizando **Flutter**, garantindo compatibilidade com Android e iOS, e contará com as seguintes tecnologias e pacotes:

- ⚡ **State Management:** [MobX](https://pub.dev/packages/mobx)  
  Para gerenciar o estado do aplicativo de forma reativa e organizada.

- 🧩 **Injeção de Dependência:** [GetIt](https://pub.dev/packages/get_it)  
  Para gerenciar a criação e compartilhamento de instâncias de classes em todo o app.

- 💾 **Banco de Dados Local:** [SQLite](https://pub.dev/packages/sqflite)  
  Para armazenamento persistente de dados, como eventos salvos e preferências do usuário.

- 🔒 **Preferências Locais:** [SharedPreferences](https://pub.dev/packages/shared_preferences)  
  Para salvar configurações e dados simples, como usuário logado ou preferências de notificação.

---

## 🏗 Estrutura do Projeto
O projeto seguirá boas práticas de arquitetura, como **Clean Architecture**, separando camadas de:
- **Presentation:** Widgets e telas do app.  
- **Domain:** Regras de negócio e entidades.  
- **Data:** Acesso a dados, banco local e APIs externas.

---

## 🚀 Como Rodar
1. Clone o repositório:  
```bash
git clone <https://github.com/leoschwedler/HypeNow>
