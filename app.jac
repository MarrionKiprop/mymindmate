###############################################################
#                     MINDMATE AI — GRAPHY VERSION
###############################################################

import from byllm.lib { Model }
import time;
glob llm = Model(model_name="openai/gpt-4o-mini", verbose=False);

###############################################################
#                         CORE NODES
###############################################################

node MindUser {
    has name: str = "Marrion";
    has zodiac: str = "Capricorn";
}

node Conversation {
    has message: str;
    has timestamp: str = "now";
}
node WellbeingLog {
    has body_state: str;
    has stress_level: str;
    has timestamp: str = "now";
}

node MoodLog {
    has mood: str;
    has timestamp: str = "now";
}

node DailyJournal {
    has content: str;
    has timestamp: str = "now";
}

node HabitEntry {
    has habit: str;
    has timestamp: str = "now";
}

node MealLog {
    has description: str;
    has timestamp: str = "now";
}

node CreativityItem {
    has text: str;
    has kind: str;   
}

node LearningItem {
    has text: str;
    has topic: str;
}

###############################################################
#                    EDGES = RELATIONSHIPS
###############################################################

# All logs hang off the MindUser via typed edges
edge Spoke {}          # MindUser --Spoke--> Conversation
edge LoggedMood {}     # MindUser --LoggedMood--> MoodLog
edge WroteJournal {}   # MindUser --WroteJournal--> DailyJournal
edge DidHabit {}       # MindUser --DidHabit--> HabitEntry
edge LoggedMeal {}     # MindUser --LoggedMeal--> MealLog
edge CreatedContent {} # MindUser --CreatedContent--> CreativityItem
edge Learned {}        # MindUser --Learned--> LearningItem
edge LoggedWellbeing {}

###############################################################
#                    LLM FUNCTION DECLARATIONS
###############################################################
###############################################################
#                    LLM FUNCTION DECLARATIONS
###############################################################

def chat_reply(msg: str) -> str by llm;
sem chat_reply = """
You are MindMate, a gentle supportive companion.
Respond kindly and briefly (1–3 sentences) to the user's message.

User said: {{msg}}
""";

def extract_mood(messages: list[str]) -> str by llm;
sem extract_mood = """
From these user messages: {{messages}}
Extract a simple emotional state (1–2 words).
Examples: "tired", "stressed", "calm", "frustrated", "curious".
ONLY return the mood word.
""";

def extract_journal(messages: list[str]) -> str by llm;
sem extract_journal = """
Summarize the user's day based on these messages: {{messages}}
Write a SHORT 1–2 sentence description of their activities.
Focus ONLY on what they did or talked about.
No advice, no emotional interpretation.
""";

def extract_habits(messages: list[str]) -> list[str] by llm;
sem extract_habits = """
From these messages: {{messages}}
Extract simple action words describing what the user did.
Return ONLY a JSON list of verbs or short phrases, e.g.:
["studied", "asked questions", "ate", "researched"]
""";

def extract_food(messages: list[str]) -> list[str] by llm;
sem extract_food = """
From these messages: {{messages}}
Extract ONLY food and drink mentioned.
Return a JSON list of simple names like:
["tea", "vegetables", "cabbage", "spinach"]
""";

def extract_creativity_seed(messages: list[str]) -> str by llm;
sem extract_creativity_seed = """
From the themes in these messages: {{messages}}
Create a short 2–5 word creativity seed.
Make it abstract but meaningful.
""";

def extract_learning_seed(messages: list[str]) -> str by llm;
sem extract_learning_seed = """
From the user's questions and topics in these messages: {{messages}}
Extract a small learning concept, 2–5 words.
Examples: "cultural history", "coding basics", "daily nutrition".
""";

def extract_body_state(messages: list[str]) -> str by llm;
sem extract_body_state = """
From these messages: {{messages}}
Extract a simple physical or energy state like:
"low energy", "fatigued", "okay", "energetic".
Only return the phrase.
""";

def extract_stress(messages: list[str]) -> str by llm;
sem extract_stress = """
From these messages: {{messages}}
Identify the user's apparent stress level.
Return ONLY one of:
"low", "medium", "high".
""";
def daily_message(
    mood: str,
    stress: str,
    body_state: str,
    habits: list[str]
) -> str by llm;

sem daily_message = """
You are MindMate.

Generate a warm 3–5 sentence welcome message based on:
- current mood: {{mood}}
- stress level: {{stress}}
- body state: {{body_state}}
- recent habits: {{habits}}

Tone:
- gentle
- acknowledging the user's real state
- soft, friendly opening to the day
- NO advice
- NO instructions
- NO motivation

Only reflect feelings and state gently.
""";

def mood_tip(
    mood: str,
    stress: str,
    body_state: str,
    habits: list[str]
) -> str by llm;

sem mood_tip = """
Given:
- mood: {{mood}}
- stress: {{stress}}
- body state: {{body_state}}
- recent habits: {{habits}}

Provide Two short, practical tips the user can do right now.

Rules:
- must be doable in under 5 minutes
- must match physical and emotional state
- no generic motivation
- no therapy
- no instructions requiring special resources
""";

def creativity_tip(
    mood: str,
    seed: str,
    habits: list[str]
) -> str by llm;

sem creativity_tip = """
Given:
- mood: {{mood}}
- creativity seed: {{seed}}
- recent habits: {{habits}}

Suggest ONE tangible, small creative action the user can do.

Allowable actions:
- draw a simple object
- write 2–4 lines
- make a tiny melody
- reorganize a small space
- observe something in nature
- describe a scene

Keep it simple, gentle, and doable.
""";

def learning_suggest(
    mood: str,
    learning_seed: str,
    habits: list[str]
) -> str by llm;

sem learning_suggest = """
Given:
- mood: {{mood}}
- learning seed: {{learning_seed}}
- recent habits: {{habits}}

Recommend THREE tiny learning ideas (1 sentence each).

It must relate to the seed or the user's recent behaviors or interests.
Keep it soft, doable, and context-aware.
""";
def generate_horoscope(
    zodiac: str,
    mood: str,
    stress: str,
    body_state: str
) -> str by llm;

sem generate_horoscope = """
You are MindMate.

Given:
- zodiac: {{zodiac}}
- mood: {{mood}}
- stress: {{stress}}
- body_state: {{body_state}}

Write a warm 2–4 sentence reflective horoscope-style message for the zodiac sign and characteristics.

Rules:
- NO predictions
- NO supernatural claims
- NO certainty
- Focus on tone, awareness, gentle self-care themes.
""";

def prompt_journal(
    mood: str,
    last_topic: str,
    habits: list[str],
    stress: str,
    body_state: str
) -> str by llm;

sem prompt_journal = """
Given:
- mood: {{mood}}
- recent journal topic: {{last_topic}}
- recent habits: {{habits}}
- stress level: {{stress}}
- body state: {{body_state}}

Create TWO gentle journal prompts rooted in:
- daily experiences
- feelings
- routines
- creativity
- nature
- memory

One sentence.
Open-ended.
Supportive.
""";
def food_tip(
    food: list[str],
    body_state: str,
    stress: str
) -> str by llm;

sem food_tip = """
Given:
- recent meals: {{food}}
- body state: {{body_state}}
- stress level: {{stress}}

Write ONE nutrition reflection.

Must include:
- reassurance / positive reinforcement
- mention one food directly if possible
- gentle, safe suggestion
- NO medical advice
- NO restrictions
""";

###############################################################
#                     CHAT WALKER (REPLACES
#           start_checkin + continue_checkin + store_checkin
###############################################################
###############################################################
#                     CHAT WALKER
###############################################################

walker chat {
    has user_message: str;

    can run with `root entry {
        # Get or create the single MindUser
        users = [root --> (`?MindUser)];
        u = users[0] if users else (root ++> MindUser(name="Friend", zodiac="Gemini"))[0];

        # 3. Also attach a Conversation node if you want
        u ++> Conversation(message=self.user_message);
        
        # 4. Generate reply
        r = chat_reply(self.user_message);

        report {"reply": r};
    }
}


###############################################################
#                STATE WALKER (GRAPH STYLE)
###############################################################

walker MindState {
    has messages: list[str] = [];
    has moods: list[str] = [];
    has meals: list[str] = [];
    has habits: list[str] = [];
    has last_journal: str = "";

    has creativity_items: list[str] = [];
    has creativity_kinds: list[str] = [];

    has learning_items: list[str] = [];
    has learning_topics: list[str] = [];
    has wellbeing_body_states: list[str] = [];
    has wellbeing_stress_levels: list[str] = [];


    # Start from the MindUser and walk outwards
    can collect_root with MindUser entry {
        visit [-->];
    }

    # Conversations → messages
    can collect_convo with Conversation entry {
        self.messages.append(here.message);
        visit [-->];
    }

    # Mood logs → moods
    can collect_mood with MoodLog entry {
        self.moods.append(here.mood);
        visit [-->];
    }

    # Meals → meals
    can collect_meal with MealLog entry {
        self.meals.append(here.description);
        visit [-->];
    }

    # Habits → habits
    can collect_habit with HabitEntry entry {
        self.habits.append(here.habit);
        visit [-->];
    }

    # Journals → last_journal
    can collect_journal with DailyJournal entry {
        self.last_journal = here.content;
        visit [-->];
    }

    # Creativity → creativity_items, creativity_kinds
    can collect_creativity with CreativityItem entry {
        self.creativity_items.append(here.text);
        self.creativity_kinds.append(here.kind);
        visit [-->];
    }

    # Learning → learning_items, learning_topics
    can collect_learning with LearningItem entry {
        self.learning_items.append(here.text);
        self.learning_topics.append(here.topic);
        visit [-->];
    }
    can collect_wellbeing with WellbeingLog entry {
    self.wellbeing_body_states.append(here.body_state);
    self.wellbeing_stress_levels.append(here.stress_level);
    visit [-->];
}


}


###############################################################
#                    INSIGHTS GENERATION
###############################################################
walker generate_insights {
    can run with MindUser entry {

        # Get/create user
        users = [root --> (`?MindUser)];
        u = users[0] if users else (root ++> MindUser(name="Friend"))[0];

        # Collect messages
        state = u spawn MindState();

        msgs = [];
        for m in state.messages {
            msgs.append(m);
        }

        print("MESSAGES:", msgs);

        # ---- Run separate LLM extractors ----
        mood = extract_mood(msgs);
        journal = extract_journal(msgs);
        habits        = extract_habits(msgs);
        food          = extract_food(msgs);
        creativity    = extract_creativity_seed(msgs);
        learning      = extract_learning_seed(msgs);
        body_state    = extract_body_state(msgs);
        stress_level  = extract_stress(msgs);
        

        # Combine structured result
        results = {
            "mood": mood,
            "journal": journal,
            "habits": habits,
            "food": food,
            "creativity_seed": creativity,
            "learning_seed": learning,
            "body_state": body_state,
            "stress_level": stress_level,
    
        };

        print("COMBINED INSIGHTS:", results);

        # ---- Store to graph ----

        if mood != "" {
            u +>:LoggedMood:+> MoodLog(mood=mood, timestamp="now");
        }

        if journal != "" {
            u +>:WroteJournal:+> DailyJournal(content=journal, timestamp="now");
        }

        if habits != [] {
            for h in habits {
                u +>:DidHabit:+> HabitEntry(habit=h, timestamp="now");
            }
        }

        if food != [] {
            for f in food {
                u +>:LoggedMeal:+> MealLog(description=f, timestamp="now");
            }
        }

        if creativity != "" {
            u +>:CreatedContent:+> CreativityItem(text=creativity, kind="seed");
        }
        u +>:LoggedWellbeing:+> WellbeingLog(body_state=body_state, stress_level=stress_level,timestamp="now"
);

        if learning != "" {
            u +>:Learned:+> LearningItem(text=learning, topic="daily_insight");
        }

        report results;
    }
}


###############################################################
#                     DASHBOARD WALKER
###############################################################
walker daily_dashboard {
    can run with `root entry {

        ###########################################
        # 1) Get or create user
        ###########################################
        users = [root --> (`?MindUser)];
        u = users[0] if users else (root ++> MindUser(name="Marrion", zodiac="Gemini"))[0];


        ###########################################
        # 2) ALWAYS generate insights BEFORE dashboard
        ###########################################
        root spawn generate_insights();


        ###########################################
        # 3) FETCH FRESH updated logs
        ###########################################

        # --- Latest mood ---
        moods = [u ->:LoggedMood:->(`?MoodLog)];
        mood = "neutral";
        if moods {
            mood = moods[-1].mood;
        }

        # --- Latest journal ---
        journals = [u ->:WroteJournal:->(`?DailyJournal)];
        last_journal = "";
        if journals {
            last_journal = journals[-1].content;
        }

        # --- Latest habits (last 5) ---
        habits = [u ->:DidHabit:->(`?HabitEntry)];
        latest_habits = [];
        for h in habits[-5:] {
            latest_habits.append(h.habit);
        }

        # --- Extract creativity seed from journal ---
        seed = mood;
        last_topic = "";
        if last_journal != "" {
            words = last_journal.split(" ");
            seed = " ".join(words[0:min(10, len(words))]);
            last_topic = seed;
        }

        # --- Latest meals ---
        meals = [u ->:LoggedMeal:->(`?MealLog)];
        food_items = [];
        for m in meals[-5:] {
            food_items.append(m.description);
        }

        # --- Latest wellbeing ---
        body_state = "okay";
        stress = "medium";
        wellbeing = [u ->:LoggedWellbeing:->(`?WellbeingLog)];
        if wellbeing {
            body_state = wellbeing[-1].body_state;
            stress     = wellbeing[-1].stress_level;
        }

        # --- Latest learning seed (stored from insights) ---
        learning_items = [u ->:Learned:->(`?LearningItem)];
        learning_seed = "";
        if learning_items {
            learning_seed = learning_items[-1].text;
        }


        ###########################################
        # 4) BUILD DASHBOARD VIA UPDATED LLM CALLS
        ###########################################

        msg = daily_message(
            mood,
            stress,
            body_state,
            latest_habits
        );

        tip = mood_tip(
            mood,
            stress,
            body_state,
            latest_habits
        );

        creat_tip = creativity_tip(
            mood,
            seed,
            latest_habits
        );

        learn = learning_suggest(
            mood,
            learning_seed,
            latest_habits
        );

        horoscope = generate_horoscope(
            u.zodiac,
            mood,
            stress,
            body_state
        );

        jp = prompt_journal(
            mood,
            last_topic,
            latest_habits,
            stress,
            body_state
        );

        nutr_msg = food_tip(
            food_items,
            body_state,
            stress
        );


        ###########################################
        # 5) RETURN DASHBOARD PAYLOAD
        ###########################################
        report {
            "header": "Hi " + u.name,
            "message": msg,
            "mood_tip": tip,
            "creativity_tip": creat_tip,
            "learning": learn,
            "horoscope": horoscope,
            "journal_prompt": jp,
            "nutrition_summary": nutr_msg
        };
    }
}





