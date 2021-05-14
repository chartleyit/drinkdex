package main

import "github.com/gofiber/fiber/v2"

const welcome = "Hello, I'm DrinkDex"

func main() {
	app := fiber.New()

	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString(welcome)
	})

	app.Listen(":18150")
}
