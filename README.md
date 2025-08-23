# 🌸 Suno – Samjho  
> 🧠 An AI-powered **mental health screening app** built with **Flutter + Supabase**, designed for culturally-aware, multilingual support.  

---

## 📌 Overview  
Suno – Samjho is a **mental health companion app** that combines **speech, text, and AI-driven analysis** to detect early signs of depression and anxiety.  
It is designed with a **privacy-first approach**, supporting 22+ Indian languages and idioms, and is accessible to **92% of Android & iOS users**.

---

## ✨ Features  
✅ Multilingual support (22+ Indian languages, Hinglish, code-switching)  
✅ Voice & text-based emotional screening  
✅ AI chatbot powered by CBT, ACT & mindfulness frameworks  
✅ Supabase-powered authentication (Google / Email)  
✅ Real-time crisis detection & escalation to professionals  
✅ Privacy-first storage with encrypted sessions  
✅ Interactive dashboard with health stats, mood meter, and suggestions  

---

## 🏗️ Tech Stack  

- **Frontend:** Flutter (Dart)  
- **Backend:** Supabase (Auth, Storage, DB) + FastAPI (AI APIs)  
- **AI/NLP Models:** HuggingFace Transformers, Whisper, IndicBERT  
- **Database:** Supabase Postgres  
- **Other Tools:** Firebase (notifications), Docker, GitHub Actions  

---

## 📱 App Flow  

```mermaid
graph TD
    A[Splash Screen] --> B[Onboarding Pages]
    B --> C[Login / SignUp (Supabase)]
    C --> D[Main Dashboard]
    D --> E[Chatbot Page]
    D --> F[General Info Page]
    D --> G[Profile Page]
