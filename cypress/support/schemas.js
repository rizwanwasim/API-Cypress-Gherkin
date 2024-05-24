import { z } from "zod";

const userObjectSchema = z.object({
  id: z.number(),
  email: z.string().email(),
  first_name: z.string(),
  last_name: z.string(),
  avatar: z.string().url(),
});

const createUserSchema = z.object({
  createdAt: z.string().datetime(),
  id: z.string(),
  job: z.string(),
  name: z.string(),
});

const getUserSchema = z.object({
  data: userObjectSchema,
});

const listUserSchema = z.object({
  page: z.number(),
  per_page: z.number(),
  total: z.number(),
  total_pages: z.number(),
  data: z.array(userObjectSchema),
});

const resourceObjectSchema = z.object({
  id: z.number(),
  name: z.string(),
  year: z.number(),
  color: z.string(),
  pantone_value: z.string(),
});

const getResourceSchema = z.object({
  data: resourceObjectSchema,
});

const listResourceSchema = z.object({
  page: z.number(),
  per_page: z.number(),
  total: z.number(),
  total_pages: z.number(),
  data: z.array(resourceObjectSchema),
});

const loginSuccessSchema = z.object({
  token: z.string(),
});

const loginFailedSchema = z.object({
  error: z.string(),
});

const registrationSuccessSchema = z.object({
  id: z.number(),
  token: z.string(),
});
const registrationFailedSchema = z.object({
  error: z.string(),
});
const updateUserSchema = z.object({
  name: z.string(),
  job: z.string(),
  updatedAt: z.string().datetime(),
});

export default {
  createUserSchema,
  getUserSchema,
  listUserSchema,
  getResourceSchema,
  listResourceSchema,
  loginSuccessSchema,
  loginFailedSchema,
  registrationSuccessSchema,
  registrationFailedSchema,
  updateUserSchema,
};
