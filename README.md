## What Is FocusFeed?

FocusFeed is a mobile app that replaces social media doomscrolling with productive learning. Instead of blocking TikTok/Instagram, it gives students a TikTok-style swipeable feed of flashcards, quizzes, and micro-explainers pulled from their own coursework. The core insight: redirect dopamine instead of fighting it.

**Tagline:** Replace the Scroll. Reclaim Your Time.
**Target users:** College students who lose study time to social media scrolling.
**Positioning:** "Duolingo proved learning can be addictive. Anki proved spaced repetition works. One Sec proved you can intervene at temptation. FocusFeed combines all three — but for your actual coursework."

---

## Tech Stack

| Layer | Technology | Notes |
|-------|-----------|-------|
| Frontend | **Flutter (Dart)** | Single codebase for iOS + Android |
| Backend | **Firebase** | Auth, Firestore, Cloud Functions. Free tier supports 500+ users |
| State Management | **Riverpod** | Preferred over Provider for testability and scalability |
| Routing | **GoRouter** | Standard Flutter navigation |
| Data Models | **Freezed + json_serializable** | Immutable models with serialization |
| AI (V2) | **OpenAI / Claude API** | Auto-generate flashcards from syllabi |
| Cloud Functions | **TypeScript** | Server-side logic for AI pipeline |
| Version Control | **Git + GitHub** | PRs required, never push directly to main |

---

## Team & Roles

| Role | Responsibility |
|------|---------------|
| **Software Architect (Trinh)** | System structure, data models, service layer, tech decisions, unblocking the team |
| **Scrum Master** | Sprint planning, backlog management, standups, removing blockers |
| **UI/UX Designer** | Figma wireframes and components, design system, screen flows |
| **Senior Developer** | Core UI implementation, swipe mechanics, feature development |
| **Product Tester / DevOps** | Testing, bug reporting, build management, Firebase monitoring |

---

**Task Management & Workflow**

We are using a Kanban board to manage all project tasks: https://github.com/users/CardinTran/projects/4

**How task selection works**

* Team members may self-select tasks from the Kanban board.
* Priorities are indicated using the Priority field (P0–P4).
* P0 tasks should be addressed first, as they are foundational or blocking.
  
**Accountability & Rebalancing**

* During the first week, task ownership is flexible to allow everyone to ramp up.
* After the initial week of execution, task assignments may be rebalanced based on:
  * Task throughput
  * Responsiveness
  * Quality and timeliness of deliverables
* This is to ensure critical work progresses smoothly and the team remains unblocked.

**Expectations**

* Only take tasks you can actively work on.
* Move tasks across columns as status changes.
* Communicate blockers early.
* Keep scope tight and aligned with the Kanban priorities.
