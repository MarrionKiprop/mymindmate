import {__jacJsx, __jacSpawn} from "@jac-client/utils";
import { useState, useEffect } from "react";
import { Router, Routes, Route, Link, Navigate, useNavigate, jacSignup, jacLogin, jacLogout, jacIsLoggedIn } from "@jac-client/utils";
function Navigation() {
  let isLoggedIn = jacIsLoggedIn();
  let navigate = useNavigate();
  function handleLogout(e) {
    e.preventDefault();
    jacLogout();
    navigate("/login");
  }
  if (isLoggedIn) {
    return __jacJsx("nav", {"style": {"padding": "12px 24px", "background": "#1e293b", "color": "#e5e7eb", "display": "flex", "justifyContent": "space-between", "alignItems": "center"}}, [__jacJsx("div", {"style": {"fontWeight": "600", "fontSize": "18px"}}, ["MindMate AI"]), __jacJsx("div", {"style": {"display": "flex", "gap": "16px", "fontSize": "14px"}}, [__jacJsx(Link, {"to": "/chat", "style": {"color": "#e5e7eb", "textDecoration": "none"}}, ["Chat"]), __jacJsx(Link, {"to": "/dashboard", "style": {"color": "#e5e7eb", "textDecoration": "none"}}, ["Dashboard"]), __jacJsx("button", {"onClick": handleLogout, "style": {"background": "none", "color": "#e5e7eb", "border": "1px solid #e5e7eb", "padding": "4px 12px", "borderRadius": "4px", "cursor": "pointer"}}, ["Logout"])])]);
  }
  return __jacJsx("nav", {"style": {"padding": "12px 24px", "background": "#1e293b", "color": "#e5e7eb", "display": "flex", "justifyContent": "space-between", "alignItems": "center"}}, [__jacJsx("div", {"style": {"fontWeight": "600", "fontSize": "18px"}}, ["MindMate AI"]), __jacJsx("div", {"style": {"display": "flex", "gap": "16px", "fontSize": "14px"}}, [__jacJsx(Link, {"to": "/login", "style": {"color": "#e5e7eb", "textDecoration": "none"}}, ["Login"]), __jacJsx(Link, {"to": "/signup", "style": {"color": "#e5e7eb", "textDecoration": "none"}}, ["Sign Up"])])]);
}
function LoginPage() {
  let [username, setUsername] = useState("");
  let [password, setPassword] = useState("");
  let [error, setError] = useState("");
  let navigate = useNavigate();
  async function handleLogin(e) {
    e.preventDefault();
    setError("");
    if (!username || !password) {
      setError("Please fill in all fields");
      return;
    }
    let success = await jacLogin(username, password);
    if (success) {
      navigate("/chat");
    } else {
      setError("Invalid credentials");
    }
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  let errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {"style": {"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}, [error]);
  }
  return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "background": "#0f172a"}}, [__jacJsx("div", {"style": {"background": "#020617", "padding": "30px", "borderRadius": "8px", "width": "280px", "boxShadow": "0 2px 10px rgba(15,23,42,0.8)", "color": "#e5e7eb"}}, [__jacJsx("h2", {"style": {"marginBottom": "20px", "textAlign": "center"}}, ["Login to MindMate"]), __jacJsx("form", {"onSubmit": handleLogin}, [__jacJsx("input", {"type": "text", "value": username, "onChange": handleUsernameChange, "placeholder": "Username", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #334155", "borderRadius": "4px", "boxSizing": "border-box", "background": "#020617", "color": "#e5e7eb"}}, []), __jacJsx("input", {"type": "password", "value": password, "onChange": handlePasswordChange, "placeholder": "Password", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #334155", "borderRadius": "4px", "boxSizing": "border-box", "background": "#020617", "color": "#e5e7eb"}}, []), errorDisplay, __jacJsx("button", {"type": "submit", "style": {"width": "100%", "padding": "8px", "background": "#3b82f6", "color": "#ffffff", "border": "none", "borderRadius": "4px", "cursor": "pointer", "fontWeight": "600", "marginTop": "4px"}}, ["Login"])]), __jacJsx("p", {"style": {"textAlign": "center", "marginTop": "12px", "fontSize": "14px"}}, ["Need an account?", " ", __jacJsx(Link, {"to": "/signup"}, ["Sign up"])])])]);
}
function SignupPage() {
  let [username, setUsername] = useState("");
  let [password, setPassword] = useState("");
  let [error, setError] = useState("");
  let navigate = useNavigate();
  async function handleSignup(e) {
    e.preventDefault();
    setError("");
    if (!username || !password) {
      setError("Please fill in all fields");
      return;
    }
    let result = await jacSignup(username, password);
    if (result["success"]) {
      navigate("/chat");
    } else {
      setError(result["error"] ? result["error"] : "Signup failed");
    }
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  let errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {"style": {"color": "#dc2626", "fontSize": "14px", "marginBottom": "10px"}}, [error]);
  }
  return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "background": "#0f172a"}}, [__jacJsx("div", {"style": {"background": "#020617", "padding": "30px", "borderRadius": "8px", "width": "280px", "boxShadow": "0 2px 10px rgba(15,23,42,0.8)", "color": "#e5e7eb"}}, [__jacJsx("h2", {"style": {"marginBottom": "20px", "textAlign": "center"}}, ["Sign Up for MindMate"]), __jacJsx("form", {"onSubmit": handleSignup}, [__jacJsx("input", {"type": "text", "value": username, "onChange": handleUsernameChange, "placeholder": "Username", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #334155", "borderRadius": "4px", "boxSizing": "border-box", "background": "#020617", "color": "#e5e7eb"}}, []), __jacJsx("input", {"type": "password", "value": password, "onChange": handlePasswordChange, "placeholder": "Password", "style": {"width": "100%", "padding": "8px", "marginBottom": "10px", "border": "1px solid #334155", "borderRadius": "4px", "boxSizing": "border-box", "background": "#020617", "color": "#e5e7eb"}}, []), errorDisplay, __jacJsx("button", {"type": "submit", "style": {"width": "100%", "padding": "8px", "background": "#3b82f6", "color": "#ffffff", "border": "none", "borderRadius": "4px", "cursor": "pointer", "fontWeight": "600", "marginTop": "4px"}}, ["Sign Up"])]), __jacJsx("p", {"style": {"textAlign": "center", "marginTop": "12px", "fontSize": "14px"}}, ["Have an account?", " ", __jacJsx(Link, {"to": "/login"}, ["Login"])])])]);
}
function ChatPage() {
  if (!jacIsLoggedIn()) {
    return __jacJsx(Navigate, {"to": "/login"}, []);
  }
  let [input, setInput] = useState("");
  let [messages, setMessages] = useState([]);
  let [loading, setLoading] = useState(false);
  async function send(e) {
    e.preventDefault();
    if (!input.trim() || loading) {
      return;
    }
    let msg = input.trim();
    setInput("");
    setLoading(true);
    let result = await __jacSpawn("chat", "", {"user_message": msg});
    let newMessages = messages.concat([{"role": "user", "text": msg}]);
    if (result && result.reports && result.reports[0]) {
      let r = result.reports[0];
      newMessages = newMessages.concat([{"role": "ai", "text": r.reply}]);
      if (r.insight) {
        newMessages = newMessages.concat([{"role": "note", "text": "\u2192 " + r.insight}]);
      }
    } else {
      newMessages = newMessages.concat([{"role": "note", "text": "(No response from server)"}]);
    }
    setMessages(newMessages);
    setLoading(false);
  }
  let hasMessages = messages.length > 0;
  return __jacJsx("div", {"style": {"minHeight": "100vh", "background": "#020617", "color": "#e5e7eb"}}, [__jacJsx("div", {"style": {"maxWidth": "800px", "margin": "0 auto", "padding": "20px"}}, [__jacJsx("div", {"style": {"height": "68vh", "overflowY": "auto", "padding": "20px", "background": "#0f172a", "borderRadius": "12px", "marginBottom": "16px"}}, [!hasMessages && __jacJsx("div", {"style": {"textAlign": "center", "marginTop": "120px", "color": "#64748b"}}, [__jacJsx("p", {"style": {"fontSize": "18px", "marginBottom": "8px"}}, ["Just talk to me"]), __jacJsx("p", {"style": {"fontSize": "14px", "opacity": 0.8}}, ["No questions. No check-ins.", __jacJsx("br", {}, []), "I'll understand how you feel."])]), hasMessages && __jacJsx("div", {}, [messages.map(msg => {
    return __jacJsx("div", {"style": {"margin": "14px 0", "textAlign": msg.role === "user" ? "right" : "left"}}, [__jacJsx("div", {"style": {"display": "inline-block", "maxWidth": "78%", "padding": "12px 18px", "borderRadius": "18px", "background": msg.role === "user" ? "#6366f1" : msg.role === "note" ? "#1e293b" : "#1e40af", "color": msg.role === "note" ? "#94a3b8" : "#f1f5f9", "fontSize": msg.role === "note" ? 13 : 15}}, [msg.text])]);
  })])]), __jacJsx("form", {"onSubmit": send, "style": {"display": "flex", "gap": "12px"}}, [__jacJsx("input", {"type": "text", "value": input, "onChange": e => {
    setInput(e.target.value);
  }, "placeholder": "Say anything...", "disabled": loading, "style": {"flex": "1", "padding": "16px", "borderRadius": "12px", "background": "#1e293b", "border": "1px solid #334155", "color": "#e2e8f0", "fontSize": "16px"}}, []), __jacJsx("button", {"type": "submit", "disabled": loading, "style": {"padding": "0 32px", "background": "#a78bfa", "color": "white", "border": "none", "borderRadius": "12px", "fontWeight": "600", "cursor": "pointer", "fontSize": "14px", "opacity": loading ? 0.7 : 1.0}}, [loading && "Listening..." || "Send"])])])]);
}
function DashboardPage() {
  if (!jacIsLoggedIn()) {
    return __jacJsx(Navigate, {"to": "/login"}, []);
  }
  let [data, setData] = useState(null);
  let [loading, setLoading] = useState(true);
  let [error, setError] = useState("");
  useEffect(() => {
    async function loadDashboard() {
      setLoading(true);
      setError("");
      let result = await __jacSpawn("daily_dashboard", "", {});
      if (result && result.reports && result.reports.length > 0) {
        setData(result.reports[0]);
      } else {
        setError("No dashboard data returned from backend.");
      }
      setLoading(false);
    }
    loadDashboard();
  }, []);
  if (loading) {
    return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "background": "#020617", "color": "#e5e7eb"}}, ["Loading MindMate..."]);
  }
  if (error || !data) {
    return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "display": "flex", "alignItems": "center", "justifyContent": "center", "background": "#020617", "color": "#e5e7eb"}}, [error || "Something went wrong."]);
  }
  let header = data.header;
  let message = data.message;
  let mood_tip = data.mood_tip;
  let creativity_tip = data.creativity_tip;
  let learning = data.learning;
  let horoscope = data.horoscope;
  let journal_prompt = data.journal_prompt;
  let nutrition_summary = data.nutrition_summary;
  return __jacJsx("div", {"style": {"minHeight": "calc(100vh - 48px)", "background": "#020617", "color": "#e5e7eb", "padding": "20px"}}, [__jacJsx("div", {"style": {"maxWidth": "900px", "margin": "0 auto"}}, [__jacJsx("div", {"style": {"marginBottom": "20px", "display": "flex", "justifyContent": "space-between", "alignItems": "center"}}, [__jacJsx("div", {}, [__jacJsx("h1", {"style": {"fontSize": "24px", "fontWeight": "600"}}, [header]), __jacJsx("p", {"style": {"fontSize": "13px", "color": "#9ca3af"}}, ["MindMate Daily Space"])])]), __jacJsx("div", {"style": {"background": "#0f172a", "borderRadius": "12px", "padding": "16px", "marginBottom": "16px", "border": "1px solid #1f2937"}}, [__jacJsx("h2", {"style": {"fontSize": "16px", "fontWeight": "600", "marginBottom": "6px"}}, ["✨ Today's Vibe"]), __jacJsx("p", {"style": {"fontSize": "14px", "marginBottom": "6px"}}, [message])]), __jacJsx("div", {"style": {"display": "grid", "gridTemplateColumns": "repeat(auto-fit, minmax(260px, 1fr))", "gap": "12px"}}, [__jacJsx("div", {"style": {"background": "#020617", "borderRadius": "10px", "padding": "12px", "border": "1px solid #1f2937"}}, [__jacJsx("h3", {"style": {"fontSize": "14px", "fontWeight": "600", "marginBottom": "4px"}}, ["🧠 Mood"]), __jacJsx("p", {"style": {"fontSize": "13px"}}, [mood_tip])]), __jacJsx("div", {"style": {"background": "#020617", "borderRadius": "10px", "padding": "12px", "border": "1px solid #1f2937"}}, [__jacJsx("h3", {"style": {"fontSize": "14px", "fontWeight": "600", "marginBottom": "4px"}}, ["🔮 Horoscope"]), __jacJsx("p", {"style": {"fontSize": "13px"}}, [horoscope])]), __jacJsx("div", {"style": {"background": "#020617", "borderRadius": "10px", "padding": "12px", "border": "1px solid #1f2937"}}, [__jacJsx("h3", {"style": {"fontSize": "14px", "fontWeight": "600", "marginBottom": "4px"}}, ["🎨 Creativity"]), __jacJsx("p", {"style": {"fontSize": "13px"}}, [creativity_tip])]), __jacJsx("div", {"style": {"background": "#020617", "borderRadius": "10px", "padding": "12px", "border": "1px solid #1f2937"}}, [__jacJsx("h3", {"style": {"fontSize": "14px", "fontWeight": "600", "marginBottom": "4px"}}, ["📚 Learning"]), __jacJsx("p", {"style": {"fontSize": "13px"}}, [learning])]), __jacJsx("div", {"style": {"background": "#020617", "borderRadius": "10px", "padding": "12px", "border": "1px solid #1f2937"}}, [__jacJsx("h3", {"style": {"fontSize": "14px", "fontWeight": "600", "marginBottom": "4px"}}, ["📝 Journal Prompt"]), __jacJsx("p", {"style": {"fontSize": "13px"}}, [journal_prompt])]), __jacJsx("div", {"style": {"background": "#020617", "borderRadius": "10px", "padding": "12px", "border": "1px solid #1f2937"}}, [__jacJsx("h3", {"style": {"fontSize": "14px", "fontWeight": "600", "marginBottom": "4px"}}, ["🥗 Nutrition"]), __jacJsx("p", {"style": {"fontSize": "13px"}}, [nutrition_summary])])])])]);
}
function HomePage() {
  if (jacIsLoggedIn()) {
    return __jacJsx(Navigate, {"to": "/chat"}, []);
  }
  return __jacJsx(Navigate, {"to": "/login"}, []);
}
function MindmatePage() {
  if (!jacIsLoggedIn()) {
    return __jacJsx(Navigate, {"to": "/login"}, []);
  }
  return __jacJsx("div", {"style": {"display": "flex", "height": "calc(100vh - 48px)", "background": "#020617", "color": "#e5e7eb", "overflow": "hidden"}}, [__jacJsx("div", {"style": {"flex": "1", "borderRight": "1px solid #1f2937", "overflowY": "auto"}}, [__jacJsx(ChatPage, {}, [])]), __jacJsx("div", {"style": {"width": "60%", "overflowY": "auto", "padding": "16px", "background": "#0f172a"}}, [__jacJsx(DashboardPage, {}, [])])]);
}
function app() {
  return __jacJsx(Router, {}, [__jacJsx("div", {"style": {"fontFamily": "system-ui, sans-serif"}}, [__jacJsx(Navigation, {}, []), __jacJsx(Routes, {}, [__jacJsx(Route, {"path": "/", "element": __jacJsx(HomePage, {}, [])}, []), __jacJsx(Route, {"path": "/login", "element": __jacJsx(LoginPage, {}, [])}, []), __jacJsx(Route, {"path": "/signup", "element": __jacJsx(SignupPage, {}, [])}, []), __jacJsx(Route, {"path": "/chat", "element": __jacJsx(MindmatePage, {}, [])}, [])])])]);
}
export { ChatPage, DashboardPage, HomePage, LoginPage, MindmatePage, Navigation, SignupPage, app };
