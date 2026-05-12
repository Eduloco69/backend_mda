import { useState } from "react"

import {
  useNavigate
} from "react-router-dom"

import useAuth from "../../hooks/useAuth"

import "../../styles/Dashboard.css"


export default function Sidebar() {

  const { hasPermission } =
    useAuth()

  const navigate =
    useNavigate()


  const [collapsed, setCollapsed] =
    useState(false)


  const menu = [

    {
      permission:
        "VER_MENU_NUEVO_TICKET",

      label:
        "Nuevo Ticket",

      icon:
        "🎫",

      route:
        "/tickets",

      primary:
        true
    },

    {
      permission:
        "VER_MENU_TICKETS",

      label:
        "Tickets",

      icon:
        "📋",

      route:
        "/tickets"
    },

    {
      permission:
        "VER_MENU_USUARIOS",

      label:
        "Usuarios",

      icon:
        "👤",

      route:
        "/usuarios"
    },

    {
      permission:
        "VER_MENU_DASHBOARDS",

      label:
        "Dashboard",

      icon:
        "📊",

      route:
        "/dashboard"
    },

    {
      permission:
        "VER_MENU_CONFIGURACION",

      label:
        "Configuración",

      icon:
        "⚙️",

      route:
        "/configuracion"
    }
  ]


  return (

    <aside
      className={
        `sidebar ${
          collapsed
            ? "collapsed"
            : ""
        }`
      }
    >

      <button

        className="collapse-btn"

        onClick={() =>
          setCollapsed(
            !collapsed
          )
        }
      >

        ☰

      </button>


      <nav>

        {
          menu.map(item => (

            hasPermission(
              item.permission
            ) && (

              <button

                key={
                  item.permission
                }

                onClick={() =>
                  navigate(
                    item.route
                  )
                }

                className={
                  item.primary
                    ? "menu-btn primary"
                    : "menu-btn"
                }
              >

                <span className="icon">

                  {item.icon}

                </span>


                {!collapsed && (

                  <span>

                    {item.label}

                  </span>

                )}

              </button>
            )
          ))
        }

      </nav>

    </aside>
  )
}