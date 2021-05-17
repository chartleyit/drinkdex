package main

import (
	"github.com/ansrivas/fiberprometheus/v2"
	"github.com/gofiber/fiber/v2"
)

var Version = "development"

const (
	appName         = "ddex"
	friendlyAppName = "Drink Dex"
	welcome         = "Hello, I'm DrinkDex"
)

func main() {
	app := fiber.New()

	// setup metrics
	prometheus := fiberprometheus.New(appName)
	prometheus.RegisterAt(app, "/metrics")
	app.Use(prometheus.Middleware)

	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString(welcome)
	})

	app.Get("/drinks", func(c *fiber.Ctx) error {
		return c.SendString("here you will be able to do things with drinks")
	})

	app.Listen(":18150")
}
