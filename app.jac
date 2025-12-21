###############################################################
#                     MINDMATE AI
###############################################################

import from byllm.lib { Model }
import time;
import from src.time_service { now_iso, within_last_24h }


glob llm = Model(model_name="openai/gpt-4o-mini", verbose=False);

###############################################################
# Helpers
###############################################################

def nowiso() -> str {
    return now_iso();
}

def is_recent(ts: str) -> bool {
    return within_last_24h(ts);
}


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
    has timestamp: str = "now";
}

node LearningItem {
    has text: str;
    has topic: str;
    has timestamp: str = "now";
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
edge LoggedWellbeing {} # MindUser --LoggedWellbeing--> WellbeingLog


###############################################################
#                    LLM FUNCTION DECLARATIONS
###############################################################


def chat_reply(msg: str) -> str by llm;
sem chat_reply = """
You are MindMate, a gentle supportive companion.
Respond kindly and briefly (1–3 sentences) to the user's message.

User said: {{msg}}
""";

###############################################################
#                    LLM EXTRACTORS 
###############################################################

def extract_mood(messages: list[str]) -> str by llm;
sem extract_mood = """
You must output ONLY a mood label.

Rules:
- Output 1 or 2 words total.
- No punctuation.
- No quotes.
- No JSON.
- No extra text.
- If two labels fit, pick the stronger ONE.

Allowed examples:
tired
stressed
calm
frustrated
curious
excited
mixed
okay
neutral
happy
overwhelmed

Messages: {{messages}}
Output:
""";


def extract_journal(messages: list[str]) -> str by llm;
sem extract_journal = """
Summarize activities ONLY.

Rules:
- 1 to 2 sentences.
- No bullet points.
- No advice.
- No emotions analysis.
- No quotes.
- No timestamps unless explicitly mentioned.
- Focus on what the user did, asked for, watched, ate/drank, or planned.

Messages: {{messages}}
Summary:
""";


def extract_habits(messages: list[str]) -> list[str] by llm;
sem extract_habits = """
Extract actions the user did (habits/activities).

Rules:
- Output MUST be valid JSON array of strings.
- No markdown.
- No extra keys.
- No extra text.
- Max 8 items.
- Use short verb phrases (2-5 words each).
- DO NOT include foods/drinks (those belong to extract_food).
- DO NOT include moods/emotions (those belong to extract_mood).
- If no habits are clear, output [] exactly.

Example output:
["studied", "watched a show", "took a nap", "took a bath"]

Messages: {{messages}}
JSON:
""";


def extract_food(messages: list[str]) -> list[str] by llm;
sem extract_food = """
Extract ONLY foods/drinks mentioned.

Rules:
- Output MUST be valid JSON array of strings.
- No markdown.
- No extra text.
- If none mentioned, output [] exactly.
- Use simple names (e.g., "tea", "milk", "banana", "matoke", "spinach").
- DO NOT include actions (e.g., "drinking tea" -> "tea").

Messages: {{messages}}
JSON:
""";


def extract_creativity_seed(messages: list[str]) -> str by llm;
sem extract_creativity_seed = """
Create a creativity seed.

Rules:
- Output ONLY 2 to 5 words.
- No commas.
- No punctuation.
- No lists.
- No sentences.
- No quotes.
- Make it abstract but tied to themes in the messages.

Examples:
late night sketches
desert drone silhouettes
tea coffee fusion
quiet bath ritual

Messages: {{messages}}
Seed:
""";


def extract_learning_seed(messages: list[str]) -> str by llm;
sem extract_learning_seed = """
Create a learning seed.

Rules:
- Output ONLY 2 to 5 words.
- No JSON.
- No punctuation.
- No sentences.
- No quotes.
- Must be a learnable topic related to chat themes.

Examples:
intelligence thriller tropes
sleep schedule habits
focus reading routine
caffeine and sleep

Messages: {{messages}}
Seed:
""";


def extract_body_state(messages: list[str]) -> str by llm;
sem extract_body_state = """
Extract physical/energy state.

Rules:
- Output ONLY 1 to 3 words.
- No JSON.
- No punctuation.
- No extra text.
- No quotes.
- Pick the closest label.

Examples:
sleepy
low energy
energized
okay
relaxed
tense

Messages: {{messages}}
State:
""";


def extract_stress(messages: list[str]) -> str by llm;
sem extract_stress = """
Classify stress level.

Rules:
- Output EXACTLY one of these tokens:
low
medium
high
- No quotes, no punctuation, no extra text.
- If unclear, output medium.

Messages: {{messages}}
Stress:
""";
################################################################
#                   LLM DASHBOARD GENERATORS
################################################################


def daily_message(
    now: str,
    mood: str,
    stress: str,
    body_state: str,
    habits: list[str]
) -> str by llm;

sem daily_message = """
You are MindMate.
Generate a warm 3–5 sentence welcome message based on:
- It is currently {{now}} (use this naturally in the greeting).
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
""";


def mood_tip(
    now: str,
    mood: str,
    stress: str,
    body_state: str,
    habits: list[str]
) -> str by llm;

sem mood_tip = """
Given:
- current time: {{now}}
- mood: {{mood}}
- stress: {{stress}}
- body state: {{body_state}}
- recent habits: {{habits}}

Provide Two short, practical tips the user can do right now and considering time state or dimension or current time of day.

Rules:
- must be doable in under 5 minutes
- must match physical and emotional state
- no generic motivation
- no therapy
- no instructions requiring special resources
""";

def creativity_tip(
    now: str,
    mood: str,
    seed: str,
    habits: list[str]
) -> str by llm;

sem creativity_tip = """
Given:
- current time: {{now}}
- mood: {{mood}}
- creativity seed: {{seed}}
- recent habits: {{habits}}

Suggest FEW tangible, small creative action the user can do.

Allowable actions:
- (consider time of day)
- draw a simple object
- write 2–4 lines
- make a tiny melody
- reorganize a small space
- observe something in nature
- describe a scene

Keep it simple, gentle, and doable.
""";

def learning_suggest(
    now: str,
    mood: str,
    learning_seed: str,
    habits: list[str]
) -> str by llm;

sem learning_suggest = """
Given:
- current time: {{now}}
- mood: {{mood}}
- learning seed: {{learning_seed}}
- recent habits: {{habits}}

Recommend THREE tiny learning ideas (few sentence each).

It must relate to the learning, mood, habits, seed or the user's recent behaviors or interests.
Keep it soft, doable, and context-aware and important, time aware
""";
def generate_horoscope(
    now: str,
    zodiac: str,
    mood: str,
    stress: str,
    body_state: str
) -> str by llm;

sem generate_horoscope = """
You are MindMate.

Given:
- current time: {{now}}
- zodiac: {{zodiac}}
- mood: {{mood}}
- stress: {{stress}}
- body_state: {{body_state}}

Write a warm few sentences reflective horoscope-style message for the 
zodiac sign and characteristics.- see also per the day or time ofday,, week, month year

Rules:
- NO predictions
- NO supernatural claims
- NO certainty
- Focus on tone, awareness, gentle self-care themes.
""";

def prompt_journal(
    now: str,
    mood: str,
    last_topic: str,
    habits: list[str],
    stress: str,
    body_state: str
) -> str by llm;

sem prompt_journal = """
Given:
- current time: {{now}}
- mood: {{mood}}
- recent journal topic: {{last_topic}}
- recent habits: {{habits}}
- stress level: {{stress}}
- body state: {{body_state}}

Create few gentle journal prompts rooted in:
- daily experiences
- feelings
- routines
- creativity
- nature
- memory
Time Aware
Open-ended.
Supportive.
""";
def food_tip(
    now: str,
    food: list[str],
    body_state: str,
    stress: str
) -> str by llm;

sem food_tip = """
Given:
- recent meals: {{food}}
- body state: {{body_state}}
- stress level: {{stress}}

Write nutrition reflection. Be time aware

Must include:
- Mention the foods mentioned or saved in the log. (i know you ate this food and this in the last xxx)
- Connect gently to body state or stress.
- provide food nutrition insight.- 
- reassurance / positive reinforcement
- mention one food directly if possible
- gentle, safe suggestion
- NO medical advice
- NO restrictions
""";

###############################################################
#                     CHAT WALKER
###############################################################
walker chat {
    has user_message: str;

    can run with `root entry {
        users = [root --> (`?MindUser)];
        u = users[0] if users else (root ++> MindUser())[0];

        # 1) Always log raw message
        ts = nowiso();
        u +>:Spoke:+> Conversation(message=self.user_message, timestamp=ts);

        # 2) Reply
        r = chat_reply(self.user_message);

        report {
            "reply": r,
            "msg": [self.user_message]
        };
    }
}


###############################################################
#                 GENERATE INSIGHTS
# Reads Conversation nodes -> runs extractors -> writes nodes
###############################################################
walker generate_insights {
    can run with `root entry {

        users = [root --> (`?MindUser)];
        u = users[0] if users else (root ++> MindUser())[0];

       convos = [u ->:Spoke:->(`?Conversation)];
        recent = convos[-20:] if convos else [];
        msgs = [];
        for c in recent { msgs.append(c.message); }
         


        # Run extractors on the gathered chat history
        mood         = extract_mood(msgs);
        journal      = extract_journal(msgs);
        habits       = extract_habits(msgs);
        food         = extract_food(msgs);
        creativity   = extract_creativity_seed(msgs);
        learning     = extract_learning_seed(msgs);
        body_state   = extract_body_state(msgs);
        stress_level = extract_stress(msgs);

        ts = nowiso();

        # ---- Store to graph 
        if mood != "" {
            u +>:LoggedMood:+> MoodLog(mood=mood, timestamp=ts);
        }

        if journal != "" {
            u +>:WroteJournal:+> DailyJournal(content=journal, timestamp=ts);
        }

        if habits != [] {
            uniq_habits = [];
            for h in habits {
                if h != "" and h not in uniq_habits {
                    uniq_habits.append(h);
                }
            }
            for h in uniq_habits {
                u +>:DidHabit:+> HabitEntry(habit=h, timestamp=ts);
            }
        }

        if food != [] {
            uniq_food = [];
            for f in food {
                if f != "" and f not in uniq_food {
                    uniq_food.append(f);
                }
            }
            for f in uniq_food {
                u +>:LoggedMeal:+> MealLog(description=f, timestamp=ts);
            }
        }

        if creativity != "" {
            u +>:CreatedContent:+> CreativityItem(text=creativity, kind="seed", timestamp=ts);
        }

        u +>:LoggedWellbeing:+> WellbeingLog(
            body_state=body_state,
            stress_level=stress_level,
            timestamp=ts
        );

        if learning != "" {
            u +>:Learned:+> LearningItem(text=learning, topic="daily_insight", timestamp=ts);
        }

        visit [-->];
    }
}


###############################################################
#                     DAILY DASHBOARD
###############################################################
walker daily_dashboard {
    can run with `root entry {

        users = [root --> (`?MindUser)];
        u = users[0] if users else (root ++> MindUser())[0];
        # Ensure insights are up to date
        root spawn generate_insights();
        # --- Latest mood ---
        moods = [u ->:LoggedMood:->(`?MoodLog)];
        mood = moods[-1].mood if moods else "";

        # --- Latest journal ---
        journals = [u ->:WroteJournal:->(`?DailyJournal)];
        last_journal = journals[-1].content if journals else "";

        # --- Latest habits (last 5) ---
        habits_nodes = [u ->:DidHabit:->(`?HabitEntry)];
        latest_habits = [];
        for h in habits_nodes[-5:] {
            latest_habits.append(h.habit);
        }

        # --- Seed/topic ---
        seed = mood;
        last_topic = "";
        if last_journal != "" {
            words = last_journal.split(" ");
            seed = " ".join(words[0:min(10, len(words))]);
            last_topic = seed;
        }

        # --- Latest meals (last 5) ---
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

        # --- Latest learning seed ---
        learning_items = [u ->:Learned:->(`?LearningItem)];
        learning_seed = learning_items[-1].text if learning_items else "";

        # Build dashboard via LLM
        now = nowiso();
        msg = daily_message(now, mood, stress, body_state, latest_habits);
        tip = mood_tip(now, mood, stress, body_state, latest_habits);
        creat_tip = creativity_tip(now, mood, seed, latest_habits);
        learn = learning_suggest(now, mood, learning_seed, latest_habits);
        horoscope = generate_horoscope(now, u.zodiac, mood, stress, body_state);
        jp = prompt_journal(now, mood, last_topic, latest_habits, stress, body_state);
        nutr_msg = food_tip(now, food_items, body_state, stress);

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
