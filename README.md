# 🧠 MyMindMate AI  
### *A Graph-Driven Emotional Companion Built with Jac + byLLM + React*

MyMindMate is an intelligent emotional companion that **learns from natural conversations**, extracts wellness signals using **LLM-powered semantic functions**, stores these signals in a **graph-structured memory**, and generates a **personalized daily dashboard**.

Unlike typical chatbots, MyMindMate uses **Jac’s graph architecture** so each piece of your emotional life becomes a node connected by typed edges.  
This gives MindMate a persistent, evolving memory that grows with you.

---

## 🌿 Features at a Glance

- 💬 **Warm conversational companion**  
- 🧠 **Automatic mood & stress extraction**  
- 📝 **Daily journal summarization**  
- 🥗 **Food & habit detection from normal chat**  
- 🎨 **Creativity prompts based on your themes**  
- 📚 **Learning suggestions inferred from conversations**  
- 🔮 **Gentle horoscope reflections**  
- 📊 **Daily dashboard generated from your graph history**  
- 🔐 **Built-in login, signup, and authenticated sessions**  

---

## 🔧 Architecture Overview

MindMate is made of **three major layers**:

### **1. Graph Backend (`app.jac`)**
- Core nodes:  
  `MindUser`, `Conversation`, `MoodLog`, `DailyJournal`, `HabitEntry`,  
  `MealLog`, `WellbeingLog`, `CreativityItem`, `LearningItem`
  
- Typed edges for relationships:  
  `Spoke`, `LoggedMood`, `DidHabit`, `LoggedMeal`,  
  `WroteJournal`, `CreatedContent`, `Learned`, `LoggedWellbeing`

- Walkers:  
  - `chat` — handles every outgoing message  
  - `MindState` — crawls the user graph and collects state  
  - `generate_insights` — calls LLM extractors and stores logs  
  - `daily_dashboard` — assembles the final dashboard payload  

- LLM functions include:  
  `extract_mood`, `extract_stress`, `extract_body_state`,  
  `extract_food`, `extract_habits`, `extract_creativity_seed`,  
  `extract_learning_seed`,  
  and generative functions like  
  `daily_message`, `mood_tip`, `creativity_tip`,  
  `learning_suggest`, `generate_horoscope`, `prompt_journal`, `food_tip`.

### **2. Frontend (`app.cl.jac`)**
Fully implemented using React inside Jac:

- Authentication (login/signup) using jac-client utilities  
- Chat interface  
- Dashboard interface  
- Combined “MindmatePage” split-screen layout  
- React Router for navigation  
- Clean dark UI with Tailwind-style styling (inline styles)

### **3. My Mindmate Map**
```
MyMindMate/
│
├── assets/
├── build/
├── dist/
├── node_modules/
│
├── app.jac # Backend: graph + walkers + LLM logic
├── app.cl.jac # Frontend: React UI
│
├── app.session # Graph storage (auto-generated)
├── app.session.users.json # User account storage
│
├── package.json
├── vite.config.js
├── README.md # This file
└── ...

```

---

## **4. 🧩 Graph Model Summary**

### **MindUser**
Root entity for each authenticated user.
Everything hangs from this node.

### **Conversation**
Every message you send → stored as a Conversation node.

### **MoodLog / WellbeingLog**
Extracted from messages using LLM:
- mood  
- stress level  
- body energy state  

### **DailyJournal**
1–2 sentence reflection automatically extracted.

### **HabitEntry & MealLog**
Habits and foods detected from your normal sentences.

### **CreativityItem & LearningItem**
Extracted seeds representing curiosity and creativity.

---

## **5. 🦾 Key Walkers**

### **chat walker**
- Ensures user node exists  
- Attaches Conversation node  
- Creates friendly LLM reply  
- No check-in workflow — natural conversation only  

### **MindState walker**
Crawls:

- messages  
- moods  
- meals  
- habits  
- journals  
- creativity items  
- learning items  
- wellbeing logs  

Used by insights and the dashboard.

### **generate_insights walker**
Your emotional brain:

1. Reads messages  
2. Extracts signals using specialized LLM functions  
3. Writes MoodLog, WellbeingLog, MealLog, HabitEntry, etc.  
4. Always keeps the emotional graph up-to-date  

### **daily_dashboard walker**
Always runs `generate_insights()` first, then builds:

- Header  
- Daily welcome message  
- Mood tip  
- Creativity action  
- Learning suggestions  
- Horoscope  
- Journal prompt  
- Nutrition summary  

Returns all as JSON to frontend.

---

## **6. 🎨 UI: Chat + Dashboard**

### **ChatPage**
- Clean bubble UI  
- Loading indicator  
- Auto-scroll  
- Supports user, AI, and informational notes  

### **DashboardPage**
Displays:

- ✨ Daily Vibe  
- 🧠 Mood  
- 🔮 Horoscope  
- 🎨 Creativity  
- 📚 Learning  
- 📝 Journal Prompt  
- 🥗 Nutrition  

### **MindmatePage**
A combined layout:
Left: Chat
Right: Dashboard

Perfect for simultaneous reflection & conversation.
```
---

## 🚀 Running MyMindMate

### **1. Start the Jac backend**
```
```bash
jac serve app.jac
```
This serves:

Backend API

Frontend React bundle

at:

```
http://localhost:8000/page/app

```

## Open the app

Just visit:
```
http://localhost:8000/page/app

```

You now have:

Login / Signup

Full chat

Full dashboard

## **7. 🤖 Philosophy**

“MindMate doesn’t ask for structured check-ins.
It simply listens — and understands you.”

MindMate brings together:

Graph reasoning

Semantic LLM extraction

Emotional computing

Clean UI

Gentle design philosophy

It learns you through your ordinary words and transforms them into wellbeing insights.

---

## **8. 💙 Built by Marrion Kiprop and Collete Moindi**

This project reflects your strength in:

Graph thinking

AI engineering

NLP & LLM pipelines

Interface design

Emotional computing

Personal creativity

MindMate is a beautiful blend of engineering and empathy.