<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="logo">
    <div class="logo-icon-container">
        <i class="fas fa-laptop-code logo-icon"></i>
        <i class="fas fa-graduation-cap logo-icon-overlay"></i>
        <div class="logo-glow"></div>
    </div>
    <h1 class="logo-text">Tech Learning Hub</h1>
</div>

<style>
    /* Main logo styling */
    .logo {
        display: flex;
        align-items: center;
        justify-content: flex-start;
        padding: 6px 0;
        transition: transform 0.3s ease;
        position: relative;
        z-index: 10;
    }

    /* Logo hover effects */
    .logo:hover {
        transform: scale(1.03);
    }

    /* Logo heading styling */
    .logo-text {
        font-weight: 700;
        font-size: 1.35rem;
        background: linear-gradient(90deg, #3498db, #2c3e50);
        background-size: 200% auto;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        margin-left: 12px;
        letter-spacing: 0.5px;
        white-space: nowrap;
        animation: gradient-shift 5s ease infinite;
    }

    /* Container for the icon */
    .logo-icon-container {
        position: relative;
        display: inline-block;
        margin-right: 5px;
        transition: transform 0.4s ease;
    }

    /* Icon glow effect */
    .logo-glow {
        position: absolute;
        width: 100%;
        height: 100%;
        background: radial-gradient(circle, rgba(52, 152, 219, 0.4) 0%, rgba(52, 152, 219, 0) 70%);
        border-radius: 50%;
        filter: blur(8px);
        opacity: 0;
        transform: scale(1.5);
        z-index: -1;
        transition: opacity 0.3s ease;
    }

    .logo:hover .logo-glow {
        opacity: 1;
    }

    /* Primary icon */
    .logo-icon {
        font-size: 1.5rem;
        color: #3498db;
        transition: all 0.3s ease;
    }

    /* Secondary icon overlay */
    .logo-icon-overlay {
        position: absolute;
        top: -8px;
        right: -8px;
        font-size: 0.9rem;
        color: #ecf0f1;
        text-shadow: 0 0 4px rgba(41, 128, 185, 0.6);
        transform: rotate(15deg);
        transition: all 0.3s ease;
    }

    /* Hover effects for icons */
    .logo:hover .logo-icon-container {
        transform: rotate(5deg);
    }

    .logo:hover .logo-icon {
        color: #2ecc71;
    }

    .logo:hover .logo-icon-overlay {
        color: #f1c40f;
        transform: rotate(25deg) scale(1.1);
    }

    /* Animations */
    @keyframes gradient-shift {
        0% {
            background-position: 0% 50%;
        }
        50% {
            background-position: 100% 50%;
        }
        100% {
            background-position: 0% 50%;
        }
    }

    /* Responsive design adjustments */
    @media (max-width: 768px) {
        .logo-text {
            font-size: 1.2rem;
        }

        .logo-icon {
            font-size: 1.3rem;
        }

        .logo-icon-overlay {
            font-size: 0.8rem;
            top: -6px;
            right: -6px;
        }
    }

    @media (max-width: 480px) {
        .logo-text {
            font-size: 1.1rem;
        }
    }
</style>