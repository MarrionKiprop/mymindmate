function _regenerator() { /*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/babel/babel/blob/main/packages/babel-helpers/LICENSE */ var e, t, r = "function" == typeof Symbol ? Symbol : {}, n = r.iterator || "@@iterator", o = r.toStringTag || "@@toStringTag"; function i(r, n, o, i) { var c = n && n.prototype instanceof Generator ? n : Generator, u = Object.create(c.prototype); return _regeneratorDefine2(u, "_invoke", function (r, n, o) { var i, c, u, f = 0, p = o || [], y = !1, G = { p: 0, n: 0, v: e, a: d, f: d.bind(e, 4), d: function d(t, r) { return i = t, c = 0, u = e, G.n = r, a; } }; function d(r, n) { for (c = r, u = n, t = 0; !y && f && !o && t < p.length; t++) { var o, i = p[t], d = G.p, l = i[2]; r > 3 ? (o = l === n) && (u = i[(c = i[4]) ? 5 : (c = 3, 3)], i[4] = i[5] = e) : i[0] <= d && ((o = r < 2 && d < i[1]) ? (c = 0, G.v = n, G.n = i[1]) : d < l && (o = r < 3 || i[0] > n || n > l) && (i[4] = r, i[5] = n, G.n = l, c = 0)); } if (o || r > 1) return a; throw y = !0, n; } return function (o, p, l) { if (f > 1) throw TypeError("Generator is already running"); for (y && 1 === p && d(p, l), c = p, u = l; (t = c < 2 ? e : u) || !y;) { i || (c ? c < 3 ? (c > 1 && (G.n = -1), d(c, u)) : G.n = u : G.v = u); try { if (f = 2, i) { if (c || (o = "next"), t = i[o]) { if (!(t = t.call(i, u))) throw TypeError("iterator result is not an object"); if (!t.done) return t; u = t.value, c < 2 && (c = 0); } else 1 === c && (t = i["return"]) && t.call(i), c < 2 && (u = TypeError("The iterator does not provide a '" + o + "' method"), c = 1); i = e; } else if ((t = (y = G.n < 0) ? u : r.call(n, G)) !== a) break; } catch (t) { i = e, c = 1, u = t; } finally { f = 1; } } return { value: t, done: y }; }; }(r, o, i), !0), u; } var a = {}; function Generator() {} function GeneratorFunction() {} function GeneratorFunctionPrototype() {} t = Object.getPrototypeOf; var c = [][n] ? t(t([][n]())) : (_regeneratorDefine2(t = {}, n, function () { return this; }), t), u = GeneratorFunctionPrototype.prototype = Generator.prototype = Object.create(c); function f(e) { return Object.setPrototypeOf ? Object.setPrototypeOf(e, GeneratorFunctionPrototype) : (e.__proto__ = GeneratorFunctionPrototype, _regeneratorDefine2(e, o, "GeneratorFunction")), e.prototype = Object.create(u), e; } return GeneratorFunction.prototype = GeneratorFunctionPrototype, _regeneratorDefine2(u, "constructor", GeneratorFunctionPrototype), _regeneratorDefine2(GeneratorFunctionPrototype, "constructor", GeneratorFunction), GeneratorFunction.displayName = "GeneratorFunction", _regeneratorDefine2(GeneratorFunctionPrototype, o, "GeneratorFunction"), _regeneratorDefine2(u), _regeneratorDefine2(u, o, "Generator"), _regeneratorDefine2(u, n, function () { return this; }), _regeneratorDefine2(u, "toString", function () { return "[object Generator]"; }), (_regenerator = function _regenerator() { return { w: i, m: f }; })(); }
function _regeneratorDefine2(e, r, n, t) { var i = Object.defineProperty; try { i({}, "", {}); } catch (e) { i = 0; } _regeneratorDefine2 = function _regeneratorDefine(e, r, n, t) { function o(r, n) { _regeneratorDefine2(e, r, function (e) { return this._invoke(r, n, e); }); } r ? i ? i(e, r, { value: n, enumerable: !t, configurable: !t, writable: !t }) : e[r] = n : (o("next", 0), o("throw", 1), o("return", 2)); }, _regeneratorDefine2(e, r, n, t); }
function asyncGeneratorStep(n, t, e, r, o, a, c) { try { var i = n[a](c), u = i.value; } catch (n) { return void e(n); } i.done ? t(u) : Promise.resolve(u).then(r, o); }
function _asyncToGenerator(n) { return function () { var t = this, e = arguments; return new Promise(function (r, o) { var a = n.apply(t, e); function _next(n) { asyncGeneratorStep(a, r, o, _next, _throw, "next", n); } function _throw(n) { asyncGeneratorStep(a, r, o, _next, _throw, "throw", n); } _next(void 0); }); }; }
function _slicedToArray(r, e) { return _arrayWithHoles(r) || _iterableToArrayLimit(r, e) || _unsupportedIterableToArray(r, e) || _nonIterableRest(); }
function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _unsupportedIterableToArray(r, a) { if (r) { if ("string" == typeof r) return _arrayLikeToArray(r, a); var t = {}.toString.call(r).slice(8, -1); return "Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t ? Array.from(r) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? _arrayLikeToArray(r, a) : void 0; } }
function _arrayLikeToArray(r, a) { (null == a || a > r.length) && (a = r.length); for (var e = 0, n = Array(a); e < a; e++) n[e] = r[e]; return n; }
function _iterableToArrayLimit(r, l) { var t = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (null != t) { var e, n, i, u, a = [], f = !0, o = !1; try { if (i = (t = t.call(r)).next, 0 === l) { if (Object(t) !== t) return; f = !1; } else for (; !(f = (e = i.call(t)).done) && (a.push(e.value), a.length !== l); f = !0); } catch (r) { o = !0, n = r; } finally { try { if (!f && null != t["return"] && (u = t["return"](), Object(u) !== u)) return; } finally { if (o) throw n; } } return a; } }
function _arrayWithHoles(r) { if (Array.isArray(r)) return r; }
import { __jacJsx, __jacSpawn } from "@jac-client/utils";
import { useState, useEffect } from "react";
import { Router, Routes, Route, Link, Navigate, useNavigate, jacSignup, jacLogin, jacLogout, jacIsLoggedIn } from "@jac-client/utils";
function Navigation() {
  var isLoggedIn = jacIsLoggedIn();
  var navigate = useNavigate();
  function handleLogout(e) {
    e.preventDefault();
    jacLogout();
    navigate("/login");
  }
  if (isLoggedIn) {
    return __jacJsx("nav", {
      "style": {
        "padding": "12px 24px",
        "background": "#1e293b",
        "color": "#e5e7eb",
        "display": "flex",
        "justifyContent": "space-between",
        "alignItems": "center"
      }
    }, [__jacJsx("div", {
      "style": {
        "fontWeight": "600",
        "fontSize": "18px"
      }
    }, ["MindMate AI"]), __jacJsx("div", {
      "style": {
        "display": "flex",
        "gap": "16px",
        "fontSize": "14px"
      }
    }, [__jacJsx(Link, {
      "to": "/chat",
      "style": {
        "color": "#e5e7eb",
        "textDecoration": "none"
      }
    }, ["Chat"]), __jacJsx(Link, {
      "to": "/dashboard",
      "style": {
        "color": "#e5e7eb",
        "textDecoration": "none"
      }
    }, ["Dashboard"]), __jacJsx("button", {
      "onClick": handleLogout,
      "style": {
        "background": "none",
        "color": "#e5e7eb",
        "border": "1px solid #e5e7eb",
        "padding": "4px 12px",
        "borderRadius": "4px",
        "cursor": "pointer"
      }
    }, ["Logout"])])]);
  }
  return __jacJsx("nav", {
    "style": {
      "padding": "12px 24px",
      "background": "#1e293b",
      "color": "#e5e7eb",
      "display": "flex",
      "justifyContent": "space-between",
      "alignItems": "center"
    }
  }, [__jacJsx("div", {
    "style": {
      "fontWeight": "600",
      "fontSize": "18px"
    }
  }, ["MindMate AI"]), __jacJsx("div", {
    "style": {
      "display": "flex",
      "gap": "16px",
      "fontSize": "14px"
    }
  }, [__jacJsx(Link, {
    "to": "/login",
    "style": {
      "color": "#e5e7eb",
      "textDecoration": "none"
    }
  }, ["Login"]), __jacJsx(Link, {
    "to": "/signup",
    "style": {
      "color": "#e5e7eb",
      "textDecoration": "none"
    }
  }, ["Sign Up"])])]);
}
function LoginPage() {
  var _useState = useState(""),
    _useState2 = _slicedToArray(_useState, 2),
    username = _useState2[0],
    setUsername = _useState2[1];
  var _useState3 = useState(""),
    _useState4 = _slicedToArray(_useState3, 2),
    password = _useState4[0],
    setPassword = _useState4[1];
  var _useState5 = useState(""),
    _useState6 = _slicedToArray(_useState5, 2),
    error = _useState6[0],
    setError = _useState6[1];
  var navigate = useNavigate();
  function handleLogin(_x) {
    return _handleLogin.apply(this, arguments);
  }
  function _handleLogin() {
    _handleLogin = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee(e) {
      var success;
      return _regenerator().w(function (_context) {
        while (1) switch (_context.n) {
          case 0:
            e.preventDefault();
            setError("");
            if (!(!username || !password)) {
              _context.n = 1;
              break;
            }
            setError("Please fill in all fields");
            return _context.a(2);
          case 1:
            _context.n = 2;
            return jacLogin(username, password);
          case 2:
            success = _context.v;
            if (success) {
              navigate("/chat");
            } else {
              setError("Invalid credentials");
            }
          case 3:
            return _context.a(2);
        }
      }, _callee);
    }));
    return _handleLogin.apply(this, arguments);
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  var errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {
      "style": {
        "color": "#dc2626",
        "fontSize": "14px",
        "marginBottom": "10px"
      }
    }, [error]);
  }
  return __jacJsx("div", {
    "style": {
      "minHeight": "calc(100vh - 48px)",
      "display": "flex",
      "alignItems": "center",
      "justifyContent": "center",
      "background": "#0f172a"
    }
  }, [__jacJsx("div", {
    "style": {
      "background": "#020617",
      "padding": "30px",
      "borderRadius": "8px",
      "width": "280px",
      "boxShadow": "0 2px 10px rgba(15,23,42,0.8)",
      "color": "#e5e7eb"
    }
  }, [__jacJsx("h2", {
    "style": {
      "marginBottom": "20px",
      "textAlign": "center"
    }
  }, ["Login to MindMate"]), __jacJsx("form", {
    "onSubmit": handleLogin
  }, [__jacJsx("input", {
    "type": "text",
    "value": username,
    "onChange": handleUsernameChange,
    "placeholder": "Username",
    "style": {
      "width": "100%",
      "padding": "8px",
      "marginBottom": "10px",
      "border": "1px solid #334155",
      "borderRadius": "4px",
      "boxSizing": "border-box",
      "background": "#020617",
      "color": "#e5e7eb"
    }
  }, []), __jacJsx("input", {
    "type": "password",
    "value": password,
    "onChange": handlePasswordChange,
    "placeholder": "Password",
    "style": {
      "width": "100%",
      "padding": "8px",
      "marginBottom": "10px",
      "border": "1px solid #334155",
      "borderRadius": "4px",
      "boxSizing": "border-box",
      "background": "#020617",
      "color": "#e5e7eb"
    }
  }, []), errorDisplay, __jacJsx("button", {
    "type": "submit",
    "style": {
      "width": "100%",
      "padding": "8px",
      "background": "#3b82f6",
      "color": "#ffffff",
      "border": "none",
      "borderRadius": "4px",
      "cursor": "pointer",
      "fontWeight": "600",
      "marginTop": "4px"
    }
  }, ["Login"])]), __jacJsx("p", {
    "style": {
      "textAlign": "center",
      "marginTop": "12px",
      "fontSize": "14px"
    }
  }, ["Need an account?", " ", __jacJsx(Link, {
    "to": "/signup"
  }, ["Sign up"])])])]);
}
function SignupPage() {
  var _useState7 = useState(""),
    _useState8 = _slicedToArray(_useState7, 2),
    username = _useState8[0],
    setUsername = _useState8[1];
  var _useState9 = useState(""),
    _useState0 = _slicedToArray(_useState9, 2),
    password = _useState0[0],
    setPassword = _useState0[1];
  var _useState1 = useState(""),
    _useState10 = _slicedToArray(_useState1, 2),
    error = _useState10[0],
    setError = _useState10[1];
  var navigate = useNavigate();
  function handleSignup(_x2) {
    return _handleSignup.apply(this, arguments);
  }
  function _handleSignup() {
    _handleSignup = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee2(e) {
      var result;
      return _regenerator().w(function (_context2) {
        while (1) switch (_context2.n) {
          case 0:
            e.preventDefault();
            setError("");
            if (!(!username || !password)) {
              _context2.n = 1;
              break;
            }
            setError("Please fill in all fields");
            return _context2.a(2);
          case 1:
            _context2.n = 2;
            return jacSignup(username, password);
          case 2:
            result = _context2.v;
            if (result["success"]) {
              navigate("/chat");
            } else {
              setError(result["error"] ? result["error"] : "Signup failed");
            }
          case 3:
            return _context2.a(2);
        }
      }, _callee2);
    }));
    return _handleSignup.apply(this, arguments);
  }
  function handleUsernameChange(e) {
    setUsername(e.target.value);
  }
  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }
  var errorDisplay = null;
  if (error) {
    errorDisplay = __jacJsx("div", {
      "style": {
        "color": "#dc2626",
        "fontSize": "14px",
        "marginBottom": "10px"
      }
    }, [error]);
  }
  return __jacJsx("div", {
    "style": {
      "minHeight": "calc(100vh - 48px)",
      "display": "flex",
      "alignItems": "center",
      "justifyContent": "center",
      "background": "#0f172a"
    }
  }, [__jacJsx("div", {
    "style": {
      "background": "#020617",
      "padding": "30px",
      "borderRadius": "8px",
      "width": "280px",
      "boxShadow": "0 2px 10px rgba(15,23,42,0.8)",
      "color": "#e5e7eb"
    }
  }, [__jacJsx("h2", {
    "style": {
      "marginBottom": "20px",
      "textAlign": "center"
    }
  }, ["Sign Up for MindMate"]), __jacJsx("form", {
    "onSubmit": handleSignup
  }, [__jacJsx("input", {
    "type": "text",
    "value": username,
    "onChange": handleUsernameChange,
    "placeholder": "Username",
    "style": {
      "width": "100%",
      "padding": "8px",
      "marginBottom": "10px",
      "border": "1px solid #334155",
      "borderRadius": "4px",
      "boxSizing": "border-box",
      "background": "#020617",
      "color": "#e5e7eb"
    }
  }, []), __jacJsx("input", {
    "type": "password",
    "value": password,
    "onChange": handlePasswordChange,
    "placeholder": "Password",
    "style": {
      "width": "100%",
      "padding": "8px",
      "marginBottom": "10px",
      "border": "1px solid #334155",
      "borderRadius": "4px",
      "boxSizing": "border-box",
      "background": "#020617",
      "color": "#e5e7eb"
    }
  }, []), errorDisplay, __jacJsx("button", {
    "type": "submit",
    "style": {
      "width": "100%",
      "padding": "8px",
      "background": "#3b82f6",
      "color": "#ffffff",
      "border": "none",
      "borderRadius": "4px",
      "cursor": "pointer",
      "fontWeight": "600",
      "marginTop": "4px"
    }
  }, ["Sign Up"])]), __jacJsx("p", {
    "style": {
      "textAlign": "center",
      "marginTop": "12px",
      "fontSize": "14px"
    }
  }, ["Have an account?", " ", __jacJsx(Link, {
    "to": "/login"
  }, ["Login"])])])]);
}
function ChatPage() {
  if (!jacIsLoggedIn()) {
    return __jacJsx(Navigate, {
      "to": "/login"
    }, []);
  }
  var _useState11 = useState(""),
    _useState12 = _slicedToArray(_useState11, 2),
    input = _useState12[0],
    setInput = _useState12[1];
  var _useState13 = useState([]),
    _useState14 = _slicedToArray(_useState13, 2),
    messages = _useState14[0],
    setMessages = _useState14[1];
  var _useState15 = useState(false),
    _useState16 = _slicedToArray(_useState15, 2),
    loading = _useState16[0],
    setLoading = _useState16[1];
  function send(_x3) {
    return _send.apply(this, arguments);
  }
  function _send() {
    _send = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee3(e) {
      var msg, result, newMessages, r;
      return _regenerator().w(function (_context3) {
        while (1) switch (_context3.n) {
          case 0:
            e.preventDefault();
            if (!(!input.trim() || loading)) {
              _context3.n = 1;
              break;
            }
            return _context3.a(2);
          case 1:
            msg = input.trim();
            setInput("");
            setLoading(true);
            _context3.n = 2;
            return __jacSpawn("chat", "", {
              "user_message": msg
            });
          case 2:
            result = _context3.v;
            newMessages = messages.concat([{
              "role": "user",
              "text": msg
            }]);
            if (result && result.reports && result.reports[0]) {
              r = result.reports[0];
              newMessages = newMessages.concat([{
                "role": "ai",
                "text": r.reply
              }]);
              if (r.insight) {
                newMessages = newMessages.concat([{
                  "role": "note",
                  "text": "\u2192 " + r.insight
                }]);
              }
            } else {
              newMessages = newMessages.concat([{
                "role": "note",
                "text": "(No response from server)"
              }]);
            }
            setMessages(newMessages);
            setLoading(false);
          case 3:
            return _context3.a(2);
        }
      }, _callee3);
    }));
    return _send.apply(this, arguments);
  }
  var hasMessages = messages.length > 0;
  return __jacJsx("div", {
    "style": {
      "minHeight": "100vh",
      "background": "#020617",
      "color": "#e5e7eb"
    }
  }, [__jacJsx("div", {
    "style": {
      "maxWidth": "800px",
      "margin": "0 auto",
      "padding": "20px"
    }
  }, [__jacJsx("div", {
    "style": {
      "height": "68vh",
      "overflowY": "auto",
      "padding": "20px",
      "background": "#0f172a",
      "borderRadius": "12px",
      "marginBottom": "16px"
    }
  }, [!hasMessages && __jacJsx("div", {
    "style": {
      "textAlign": "center",
      "marginTop": "120px",
      "color": "#64748b"
    }
  }, [__jacJsx("p", {
    "style": {
      "fontSize": "18px",
      "marginBottom": "8px"
    }
  }, ["Just talk to me"]), __jacJsx("p", {
    "style": {
      "fontSize": "14px",
      "opacity": 0.8
    }
  }, ["No questions. No check-ins.", __jacJsx("br", {}, []), "I'll understand how you feel."])]), hasMessages && __jacJsx("div", {}, [messages.map(function (msg) {
    return __jacJsx("div", {
      "style": {
        "margin": "14px 0",
        "textAlign": msg.role === "user" ? "right" : "left"
      }
    }, [__jacJsx("div", {
      "style": {
        "display": "inline-block",
        "maxWidth": "78%",
        "padding": "12px 18px",
        "borderRadius": "18px",
        "background": msg.role === "user" ? "#6366f1" : msg.role === "note" ? "#1e293b" : "#1e40af",
        "color": msg.role === "note" ? "#94a3b8" : "#f1f5f9",
        "fontSize": msg.role === "note" ? 13 : 15
      }
    }, [msg.text])]);
  })])]), __jacJsx("form", {
    "onSubmit": send,
    "style": {
      "display": "flex",
      "gap": "12px"
    }
  }, [__jacJsx("input", {
    "type": "text",
    "value": input,
    "onChange": function onChange(e) {
      setInput(e.target.value);
    },
    "placeholder": "Say anything...",
    "disabled": loading,
    "style": {
      "flex": "1",
      "padding": "16px",
      "borderRadius": "12px",
      "background": "#1e293b",
      "border": "1px solid #334155",
      "color": "#e2e8f0",
      "fontSize": "16px"
    }
  }, []), __jacJsx("button", {
    "type": "submit",
    "disabled": loading,
    "style": {
      "padding": "0 32px",
      "background": "#a78bfa",
      "color": "white",
      "border": "none",
      "borderRadius": "12px",
      "fontWeight": "600",
      "cursor": "pointer",
      "fontSize": "14px",
      "opacity": loading ? 0.7 : 1.0
    }
  }, [loading && "Listening..." || "Send"])])])]);
}
function DashboardPage() {
  if (!jacIsLoggedIn()) {
    return __jacJsx(Navigate, {
      "to": "/login"
    }, []);
  }
  var _useState17 = useState(null),
    _useState18 = _slicedToArray(_useState17, 2),
    data = _useState18[0],
    setData = _useState18[1];
  var _useState19 = useState(true),
    _useState20 = _slicedToArray(_useState19, 2),
    loading = _useState20[0],
    setLoading = _useState20[1];
  var _useState21 = useState(""),
    _useState22 = _slicedToArray(_useState21, 2),
    error = _useState22[0],
    setError = _useState22[1];
  useEffect(function () {
    function loadDashboard() {
      return _loadDashboard.apply(this, arguments);
    }
    function _loadDashboard() {
      _loadDashboard = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee4() {
        var result;
        return _regenerator().w(function (_context4) {
          while (1) switch (_context4.n) {
            case 0:
              setLoading(true);
              setError("");
              _context4.n = 1;
              return __jacSpawn("daily_dashboard", "", {});
            case 1:
              result = _context4.v;
              if (result && result.reports && result.reports.length > 0) {
                setData(result.reports[0]);
              } else {
                setError("No dashboard data returned from backend.");
              }
              setLoading(false);
            case 2:
              return _context4.a(2);
          }
        }, _callee4);
      }));
      return _loadDashboard.apply(this, arguments);
    }
    loadDashboard();
  }, []);
  if (loading) {
    return __jacJsx("div", {
      "style": {
        "minHeight": "calc(100vh - 48px)",
        "display": "flex",
        "alignItems": "center",
        "justifyContent": "center",
        "background": "#020617",
        "color": "#e5e7eb"
      }
    }, ["Loading MindMate..."]);
  }
  if (error || !data) {
    return __jacJsx("div", {
      "style": {
        "minHeight": "calc(100vh - 48px)",
        "display": "flex",
        "alignItems": "center",
        "justifyContent": "center",
        "background": "#020617",
        "color": "#e5e7eb"
      }
    }, [error || "Something went wrong."]);
  }
  var header = data.header;
  var message = data.message;
  var mood_tip = data.mood_tip;
  var creativity_tip = data.creativity_tip;
  var learning = data.learning;
  var horoscope = data.horoscope;
  var journal_prompt = data.journal_prompt;
  var nutrition_summary = data.nutrition_summary;
  return __jacJsx("div", {
    "style": {
      "minHeight": "calc(100vh - 48px)",
      "background": "#020617",
      "color": "#e5e7eb",
      "padding": "20px"
    }
  }, [__jacJsx("div", {
    "style": {
      "maxWidth": "900px",
      "margin": "0 auto"
    }
  }, [__jacJsx("div", {
    "style": {
      "marginBottom": "20px",
      "display": "flex",
      "justifyContent": "space-between",
      "alignItems": "center"
    }
  }, [__jacJsx("div", {}, [__jacJsx("h1", {
    "style": {
      "fontSize": "24px",
      "fontWeight": "600"
    }
  }, [header]), __jacJsx("p", {
    "style": {
      "fontSize": "13px",
      "color": "#9ca3af"
    }
  }, ["MindMate Daily Space"])])]), __jacJsx("div", {
    "style": {
      "background": "#0f172a",
      "borderRadius": "12px",
      "padding": "16px",
      "marginBottom": "16px",
      "border": "1px solid #1f2937"
    }
  }, [__jacJsx("h2", {
    "style": {
      "fontSize": "16px",
      "fontWeight": "600",
      "marginBottom": "6px"
    }
  }, ["✨ Today's Vibe"]), __jacJsx("p", {
    "style": {
      "fontSize": "14px",
      "marginBottom": "6px"
    }
  }, [message])]), __jacJsx("div", {
    "style": {
      "display": "grid",
      "gridTemplateColumns": "repeat(auto-fit, minmax(260px, 1fr))",
      "gap": "12px"
    }
  }, [__jacJsx("div", {
    "style": {
      "background": "#020617",
      "borderRadius": "10px",
      "padding": "12px",
      "border": "1px solid #1f2937"
    }
  }, [__jacJsx("h3", {
    "style": {
      "fontSize": "14px",
      "fontWeight": "600",
      "marginBottom": "4px"
    }
  }, ["🧠 Mood"]), __jacJsx("p", {
    "style": {
      "fontSize": "13px"
    }
  }, [mood_tip])]), __jacJsx("div", {
    "style": {
      "background": "#020617",
      "borderRadius": "10px",
      "padding": "12px",
      "border": "1px solid #1f2937"
    }
  }, [__jacJsx("h3", {
    "style": {
      "fontSize": "14px",
      "fontWeight": "600",
      "marginBottom": "4px"
    }
  }, ["🔮 Horoscope"]), __jacJsx("p", {
    "style": {
      "fontSize": "13px"
    }
  }, [horoscope])]), __jacJsx("div", {
    "style": {
      "background": "#020617",
      "borderRadius": "10px",
      "padding": "12px",
      "border": "1px solid #1f2937"
    }
  }, [__jacJsx("h3", {
    "style": {
      "fontSize": "14px",
      "fontWeight": "600",
      "marginBottom": "4px"
    }
  }, ["🎨 Creativity"]), __jacJsx("p", {
    "style": {
      "fontSize": "13px"
    }
  }, [creativity_tip])]), __jacJsx("div", {
    "style": {
      "background": "#020617",
      "borderRadius": "10px",
      "padding": "12px",
      "border": "1px solid #1f2937"
    }
  }, [__jacJsx("h3", {
    "style": {
      "fontSize": "14px",
      "fontWeight": "600",
      "marginBottom": "4px"
    }
  }, ["📚 Learning"]), __jacJsx("p", {
    "style": {
      "fontSize": "13px"
    }
  }, [learning])]), __jacJsx("div", {
    "style": {
      "background": "#020617",
      "borderRadius": "10px",
      "padding": "12px",
      "border": "1px solid #1f2937"
    }
  }, [__jacJsx("h3", {
    "style": {
      "fontSize": "14px",
      "fontWeight": "600",
      "marginBottom": "4px"
    }
  }, ["📝 Journal Prompt"]), __jacJsx("p", {
    "style": {
      "fontSize": "13px"
    }
  }, [journal_prompt])]), __jacJsx("div", {
    "style": {
      "background": "#020617",
      "borderRadius": "10px",
      "padding": "12px",
      "border": "1px solid #1f2937"
    }
  }, [__jacJsx("h3", {
    "style": {
      "fontSize": "14px",
      "fontWeight": "600",
      "marginBottom": "4px"
    }
  }, ["🥗 Nutrition"]), __jacJsx("p", {
    "style": {
      "fontSize": "13px"
    }
  }, [nutrition_summary])])])])]);
}
function HomePage() {
  if (jacIsLoggedIn()) {
    return __jacJsx(Navigate, {
      "to": "/chat"
    }, []);
  }
  return __jacJsx(Navigate, {
    "to": "/login"
  }, []);
}
function MindmatePage() {
  if (!jacIsLoggedIn()) {
    return __jacJsx(Navigate, {
      "to": "/login"
    }, []);
  }
  return __jacJsx("div", {
    "style": {
      "display": "flex",
      "height": "calc(100vh - 48px)",
      "background": "#020617",
      "color": "#e5e7eb",
      "overflow": "hidden"
    }
  }, [__jacJsx("div", {
    "style": {
      "flex": "1",
      "borderRight": "1px solid #1f2937",
      "overflowY": "auto"
    }
  }, [__jacJsx(ChatPage, {}, [])]), __jacJsx("div", {
    "style": {
      "width": "60%",
      "overflowY": "auto",
      "padding": "16px",
      "background": "#0f172a"
    }
  }, [__jacJsx(DashboardPage, {}, [])])]);
}
function app() {
  return __jacJsx(Router, {}, [__jacJsx("div", {
    "style": {
      "fontFamily": "system-ui, sans-serif"
    }
  }, [__jacJsx(Navigation, {}, []), __jacJsx(Routes, {}, [__jacJsx(Route, {
    "path": "/",
    "element": __jacJsx(HomePage, {}, [])
  }, []), __jacJsx(Route, {
    "path": "/login",
    "element": __jacJsx(LoginPage, {}, [])
  }, []), __jacJsx(Route, {
    "path": "/signup",
    "element": __jacJsx(SignupPage, {}, [])
  }, []), __jacJsx(Route, {
    "path": "/chat",
    "element": __jacJsx(MindmatePage, {}, [])
  }, [])])])]);
}
export { ChatPage, DashboardPage, HomePage, LoginPage, MindmatePage, Navigation, SignupPage, app };