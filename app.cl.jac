###############################################################
# FRONTEND — Beautiful, Clean, Working
###############################################################
cl import from react { useState, useEffect }
cl import from "@jac-client/utils" {
    Router, Routes, Route, Link, Navigate, useNavigate,
    jacSignup, jacLogin, jacLogout, jacIsLoggedIn
}

cl {
    # Navigation
    def Navigation() -> any {
        let isLoggedIn = jacIsLoggedIn();
        let navigate = useNavigate();

        def handleLogout(e: any) -> None {
            e.preventDefault();
            jacLogout();
            navigate("/login");
        }

        if isLoggedIn {
            return <nav
                style={{
                    "padding": "12px 24px",
                    "background": "#1e293b",
                    "color": "#e5e7eb",
                    "display": "flex",
                    "justifyContent": "space-between",
                    "alignItems": "center"
                }}
            >
                <div
                    style={{"fontWeight": "600", "fontSize": "18px"}}
                >
                    MindMate AI
                </div>
                <div
                    style={{"display": "flex", "gap": "16px", "fontSize": "18px"}}
                >
                    <Link
                        to="/chat"
                        style={{"color": "#e5e7eb", "textDecoration": "none"}}
                    >
                        Chat
                    </Link>
                    <Link
                        to="/dashboard"
                        style={{"color": "#e5e7eb", "textDecoration": "none"}}
                    >
                        Dashboard
                    </Link>
                    <button
                        onClick={handleLogout}
                        style={{
                            "background": "none",
                            "color": "#e5e7eb",
                            "border": "1px solid #e5e7eb",
                            "padding": "4px 12px",
                            "borderRadius": "4px",
                            "cursor": "pointer"
                        }}
                    >
                        Logout
                    </button>
                </div>
            </nav>;
        }

        return <nav
            style={{
                "padding": "12px 24px",
                "background": "#1e293b",
                "color": "#e5e7eb",
                "display": "flex",
                "justifyContent": "space-between",
                "alignItems": "center"
            }}
        >
            <div
                style={{"fontWeight": "600", "fontSize": "18px"}}
            >
                MindMate AI
            </div>
            <div
                style={{"display": "flex", "gap": "16px", "fontSize": "14px"}}
            >
                <Link
                    to="/login"
                    style={{"color": "#e5e7eb", "textDecoration": "none"}}
                >
                    Login
                </Link>
                <Link
                    to="/signup"
                    style={{"color": "#e5e7eb", "textDecoration": "none"}}
                >
                    Sign Up
                </Link>
            </div>
        </nav>;
    }

    # Login Page
    def LoginPage() -> any {
        let [username, setUsername] = useState("");
        let [password, setPassword] = useState("");
        let [error, setError] = useState("");
        let navigate = useNavigate();

        async def handleLogin(e: any) -> None {
            e.preventDefault();
            setError("");
            if not username or not password {
                setError("Please fill in all fields");
                return;
            }
            success = await jacLogin(username, password);
            if success {
                navigate("/chat");
            } else {
                setError("Invalid credentials");
            }
        }

        def handleUsernameChange(e: any) -> None {
            setUsername(e.target.value);
        }

        def handlePasswordChange(e: any) -> None {
            setPassword(e.target.value);
        }

        let errorDisplay = None;
        if error {
            errorDisplay = <div
                style={{"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}
            >
                {error}
            </div>;
        }

        return <div
            style={{
                "minHeight": "calc(100vh - 48px)",
                "display": "flex",
                "alignItems": "center",
                "justifyContent": "center",
                "background": "#0f172a"
            }}
        >
            <div
                style={{
                    "background": "#020617",
                    "padding": "30px",
                    "borderRadius": "8px",
                    "width": "280px",
                    "boxShadow": "0 2px 10px rgba(15,23,42,0.8)",
                    "color": "#e5e7eb"
                }}
            >
                <h2
                    style={{"marginBottom": "20px", "textAlign": "center"}}
                >
                    Login to MindMate
                </h2>
                <form
                    onSubmit={handleLogin}
                >
                    <input
                        type="text"
                        value={username}
                        onChange={handleUsernameChange}
                        placeholder="Username"
                        style={{
                            "width": "100%",
                            "padding": "8px",
                            "marginBottom": "10px",
                            "border": "1px solid #334155",
                            "borderRadius": "4px",
                            "boxSizing": "border-box",
                            "background": "#020617",
                            "color": "#e5e7eb"
                        }}
                    />
                    <input
                        type="password"
                        value={password}
                        onChange={handlePasswordChange}
                        placeholder="Password"
                        style={{
                            "width": "100%",
                            "padding": "8px",
                            "marginBottom": "10px",
                            "border": "1px solid #334155",
                            "borderRadius": "4px",
                            "boxSizing": "border-box",
                            "background": "#020617",
                            "color": "#e5e7eb"
                        }}
                    />
                    {errorDisplay}
                    <button
                        type="submit"
                        style={{
                            "width": "100%",
                            "padding": "8px",
                            "background": "#3b82f6",
                            "color": "#ffffff",
                            "border": "none",
                            "borderRadius": "4px",
                            "cursor": "pointer",
                            "fontWeight": "600",
                            "marginTop": "4px"
                        }}
                    >
                        Login
                    </button>
                </form>
                <p
                    style={{
                        "textAlign": "center",
                        "marginTop": "12px",
                        "fontSize": "14px"
                    }}
                >
                    Need an account?{" "}
                    <Link to="/signup">
                        Sign up
                    </Link>
                </p>
            </div>
        </div>;
    }

    # Signup Page
    def SignupPage() -> any {
        let [username, setUsername] = useState("");
        let [password, setPassword] = useState("");
        let [error, setError] = useState("");
        let navigate = useNavigate();

        async def handleSignup(e: any) -> None {
            e.preventDefault();
            setError("");
            if not username or not password {
                setError("Please fill in all fields");
                return;
            }
            result = await jacSignup(username, password);
            if result["success"] {
                navigate("/chat");
            } else {
                setError(result["error"] if result["error"] else "Signup failed");
            }
        }

        def handleUsernameChange(e: any) -> None {
            setUsername(e.target.value);
        }

        def handlePasswordChange(e: any) -> None {
            setPassword(e.target.value);
        }

        let errorDisplay = None;
        if error {
            errorDisplay = <div
                style={{"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}
            >
                {error}
            </div>;
        }

        return <div
            style={{
                "minHeight": "calc(100vh - 48px)",
                "display": "flex",
                "alignItems": "center",
                "justifyContent": "center",
                "background": "#0f172a"
            }}
        >
            <div
                style={{
                    "background": "#020617",
                    "padding": "30px",
                    "borderRadius": "8px",
                    "width": "280px",
                    "boxShadow": "0 2px 10px rgba(15,23,42,0.8)",
                    "color": "#e5e7eb"
                }}
            >
                <h2
                    style={{"marginBottom": "20px", "textAlign": "center"}}
                >
                    Sign Up for MindMate
                </h2>
                <form
                    onSubmit={handleSignup}
                >
                    <input
                        type="text"
                        value={username}
                        onChange={handleUsernameChange}
                        placeholder="Username"
                        style={{
                            "width": "100%",
                            "padding": "8px",
                            "marginBottom": "10px",
                            "border": "1px solid #334155",
                            "borderRadius": "4px",
                            "boxSizing": "border-box",
                            "background": "#020617",
                            "color": "#e5e7eb"
                        }}
                    />
                    <input
                        type="password"
                        value={password}
                        onChange={handlePasswordChange}
                        placeholder="Password"
                        style={{
                            "width": "100%",
                            "padding": "8px",
                            "marginBottom": "10px",
                            "border": "1px solid #334155",
                            "borderRadius": "4px",
                            "boxSizing": "border-box",
                            "background": "#020617",
                            "color": "#e5e7eb"
                        }}
                    />
                    {errorDisplay}
                    <button
                        type="submit"
                        style={{
                            "width": "100%",
                            "padding": "8px",
                            "background": "#3b82f6",
                            "color": "#ffffff",
                            "border": "none",
                            "borderRadius": "4px",
                            "cursor": "pointer",
                            "fontWeight": "600",
                            "marginTop": "4px"
                        }}
                    >
                        Sign Up
                    </button>
                </form>
                <p
                    style={{
                        "textAlign": "center",
                        "marginTop": "12px",
                        "fontSize": "14px"
                    }}
                >
                    Have an account?{" "}
                    <Link to="/login">
                        Login
                    </Link>
                </p>
            </div>
        </div>;
    }
def ChatPage() -> any {
    if not jacIsLoggedIn() { 
        return <Navigate to="/login"/>; 
    }

    let [input, setInput] = useState("");
    let [messages, setMessages] = useState([]);
    let [loading, setLoading] = useState(False);

    async def send(e: any) -> None {
        e.preventDefault();
        if not input.trim() or loading { 
            return; 
        }

        msg = input.trim();
        setInput("");
        setLoading(True);

        result = await root spawn chat(user_message=msg);

newMessages = messages.concat([
    {"role": "user", "text": msg}
]);

if result and result.reports and result.reports[0] {
    r = result.reports[0];

    newMessages = newMessages.concat([
        {"role": "ai", "text": r.reply}
    ]);

    if r.insight {
        newMessages = newMessages.concat([
            {"role": "note", "text": "→ " + r.insight}
        ]);
    }
} else {
    newMessages = newMessages.concat([
        {"role": "note", "text": "(No response from server)"}
    ]);
}

        setMessages(newMessages);
        setLoading(False);
    }

    hasMessages = messages.length > 0;

    return <div style={{"minHeight":"100vh","background":"#020617","color":"#e5e7eb"}}>

        <div style={{"width":"80%","maxWidth":"1400px","margin":"0 auto","padding":"20px"}}>

            <div style={{
                "height":"68vh",
                "overflowY":"auto",
                "padding":"20px",
                "background":"#0f172a",
                "borderRadius":"12px",
                "marginBottom":"16px"
            }}>
                {not hasMessages and 
                    <div style={{"textAlign":"center","marginTop":"120px","color":"#64748b"}}>
                        <p style={{"fontSize":"18px","marginBottom":"8px"}}>Just talk to me</p>
                        <p style={{"fontSize":"14px","opacity":0.8}}>
                            No questions. No check-ins.<br/>I'll understand how you feel.
                        </p>
                    </div>
                }

                {hasMessages and 
                    <div>
                        {messages.map(lambda msg: any -> any {
                            return <div style={{
                                "margin":"14px 0",
                                "textAlign": ("right" if msg.role == "user" else "left")
                            }}>
                                <div style={{
                                    "display":"inline-block",
                                    "maxWidth":"78%",
                                    "padding":"12px 18px",
                                    "borderRadius":"18px",
                                    "background":
                                        ("#6366f1" if msg.role == "user" else
                                         ("#1e293b" if msg.role == "note" else "#1e40af")),
                                    "color": ("#94a3b8" if msg.role == "note" else "#f1f5f9"),
                                    "fontSize": (13 if msg.role == "note" else 15)
                                }}>
                                    {msg.text}
                                </div>
                            </div>;
                        })}
                    </div>
                }
            </div>

            <form onSubmit={send} style={{"display":"flex","gap":"12px"}}>
                <input
                    type="text"
                    value={input}
                    onChange={lambda e: any -> any { 
                        setInput(e.target.value); 
                    }}
                    placeholder="Say anything..."
                    disabled={loading}
                    style={{
                        "flex":"1",
                        "padding":"16px",
                        "borderRadius":"12px",
                        "background":"#1e293b",
                        "border":"1px solid #334155",
                        "color":"#e2e8f0",
                        "fontSize":"16px"
                    }}
                />
                <button 
                    type="submit" 
                    disabled={loading}
                    style={{
                        "padding":"0 32px",
                        "background":"#a78bfa",
                        "color":"white",
                        "border":"none",
                        "borderRadius":"12px",
                        "fontWeight":"600",
                        "cursor":"pointer",
                        "fontSize":"14px",
                        "opacity": (0.7 if loading else 1.0)
                    }}
                >
                    {loading and "Listening..." or "Send"}
                </button>
            </form>

        </div>
    </div>;
}
 def DashboardPage() -> any {
    if not jacIsLoggedIn() {
        return <Navigate to="/login" />;
    }

    let [data, setData] = useState(None);
    let [loading, setLoading] = useState(True);
    let [error, setError] = useState("");

    useEffect(
        lambda -> None {
            async def loadDashboard() -> None {
                setLoading(True);
                setError("");

                # Backend walker: daily_dashboard
                result = root spawn daily_dashboard();

                if result and result.reports and result.reports.length > 0 {
                    setData(result.reports[0]);
                } else {
                    setError("No dashboard data returned from backend.");
                }

                setLoading(False);
            }

            loadDashboard();
        },
        []
    );

    if loading {
        return <div style={{
            "minHeight": "calc(100vh - 48px)",
            "display": "flex",
            "alignItems": "center",
            "justifyContent": "center",
            "background": "#020617",
            "color": "#e5e7eb"
        }}>
            Loading MindMate...
        </div>;
    }

    if error or not data {
        return <div style={{
            "minHeight": "calc(100vh - 48px)",
            "display": "flex",
            "alignItems": "center",
            "justifyContent": "center",
            "background": "#020617",
            "color": "#e5e7eb"
        }}>
            {error or "Something went wrong."}
        </div>;
    }

    # Extract fields EXACTLY matching backend
    let header = data.header;
    let message = data.message;
    let mood_tip = data.mood_tip;
    let creativity_tip = data.creativity_tip;
    let learning = data.learning;
    let horoscope = data.horoscope;
    let journal_prompt = data.journal_prompt;
    let nutrition_summary = data.nutrition_summary;

    return <div
        style={{
            "minHeight": "calc(100vh - 48px)",
            "background": "#020617",
            "color": "#e5e7eb",
            "padding": "20px"
        }}
    >
        <div
    style={{
        "width": "94%",
        "maxWidth": "1400px",
        "margin": "0 auto"
    }}
        >

            # Header
            <div
                style={{
                    "marginBottom": "20px",
                    "display": "flex",
                    "justifyContent": "space-between",
                    "alignItems": "center"
                }}
            >
                <div>
                    <h1
                        style={{"fontSize": "30px", "fontWeight": "600"}}
                    >
                        {header}
                    </h1>
                    <p
                        style={{"fontSize": "13px", "color": "#9ca3af"}}
                    >
                        MindMate Daily Space
                    </p>
                </div>
            </div>

            # Daily message
            <div
                style={{
                    "background": "#0f172a",
                    "borderRadius": "12px",
                    "padding": "40px 50px",
                    "marginBottom": "16px",
                    "border": "1px solid #1f2937"
                }}
            >
                <h2
                    style={{"fontSize": "22px", "fontWeight": "600", "marginBottom": "6px"}}
                >
                    ✨ Today's Vibe
                </h2>
                <p
                    style={{"fontSize": "18px", "marginBottom": "6px"}}
                >
                    {message}
                </p>
            </div>

            # Grid of cards
            <div
                style={{
                    "display": "grid",
                    "gridTemplateColumns": "repeat(auto-fit, minmax(400px, 1fr))",
                    "gap": "12px"
                }}
            >

                # Mood Tip
                <div
                    style={{
                        "background": "#020617",
                        "borderRadius": "10px",
                        "padding": "12px",
                        "border": "1px solid #1f2937"
                    }}
                >
                    <h3
                        style={{"fontSize": "18px", "fontWeight": "600", "marginBottom": "4px"}}
                    >
                        🧠 Mood
                    </h3>
                    <p style={{"fontSize": "15px"}}>
                        {mood_tip}
                    </p>
                </div>

                # Horoscope
                <div
                    style={{
                        "background": "#020617",
                        "borderRadius": "10px",
                        "padding": "12px",
                        "border": "1px solid #1f2937"
                    }}
                >
                    <h3
                        style={{"fontSize": "18px", "fontWeight": "600", "marginBottom": "4px"}}
                    >
                        🔮 Horoscope
                    </h3>
                    <p style={{"fontSize": "15px"}}>
                        {horoscope}
                    </p>
                </div>

                # Creativity
                <div
                    style={{
                        "background": "#020617",
                        "borderRadius": "10px",
                        "padding": "12px",
                        "border": "1px solid #1f2937"
                    }}
                >
                    <h3
                        style={{"fontSize": "18px", "fontWeight": "600", "marginBottom": "4px"}}
                    >
                        🎨 Creativity
                    </h3>
                    <p style={{"fontSize": "15px"}}>
                        {creativity_tip}
                    </p>
                </div>

                # Learning
                <div
                    style={{
                        "background": "#020617",
                        "borderRadius": "10px",
                        "padding": "12px",
                        "border": "1px solid #1f2937"
                    }}
                >
                    <h3
                        style={{"fontSize": "18px", "fontWeight": "600", "marginBottom": "4px"}}
                    >
                        📚 Learning
                    </h3>
                    <p style={{"fontSize": "15px"}}>
                        {learning}
                    </p>
                </div>

                # Journal Prompt
                <div
                    style={{
                        "background": "#020617",
                        "borderRadius": "10px",
                        "padding": "12px",
                        "border": "1px solid #1f2937"
                    }}
                >
                    <h3
                        style={{"fontSize": "18px", "fontWeight": "600", "marginBottom": "4px"}}
                    >
                        📝 Journal Prompt
                    </h3>
                    <p style={{"fontSize": "15px"}}>
                        {journal_prompt}
                    </p>
                </div>

                # Nutrition Summary
                <div
                    style={{
                        "background": "#020617",
                        "borderRadius": "10px",
                        "padding": "12px",
                        "border": "1px solid #1f2937"
                    }}
                >
                    <h3
                            style={{"fontSize": "18px", "fontWeight": "600", "marginBottom": "4px"}}
                        >
                            🥗 Nutrition
                        </h3>

                        <p style={{"fontSize": "15px"}}>
                            {nutrition_summary}
                        </p>
                </div>

            </div>
        </div>
    </div>;
}
    

     # Home Page - redirect based on auth
    def HomePage() -> any {
        if jacIsLoggedIn() {
            return <Navigate to="/chat" />;
        }
        return <Navigate to="/login" />;
    }

    # --------------------------
    # Unified Chat + Dashboard
    # --------------------------
    def MindmatePage() -> any {
    if not jacIsLoggedIn() {
        return <Navigate to="/login" />;
    }

    return <div
        style={{
            "display": "flex",
            "height": "calc(100vh - 48px)",
            "background": "#020617",
            "color": "#e5e7eb",
            "overflow": "hidden"
        }}
    >
        <div
            style={{
                "flex": "1",
                "overflowY": "auto"
            }}
        >
            <ChatPage />
        </div>
    </div>;
}

    # --------------------------
    # Router
    # --------------------------
    def app() -> any {
        return <Router>
            <div style={{"fontFamily": "system-ui, sans-serif"}}>
                <Navigation />
                <Routes>
                    <Route path="/" element={<HomePage />} />
                    <Route path="/login" element={<LoginPage />} />
                    <Route path="/signup" element={<SignupPage />} />
                    <Route path="/chat" element={<MindmatePage />} />

                    <Route path="/dashboard" element={<DashboardPage />} />
                </Routes>
            </div>
        </Router>;
    }
}