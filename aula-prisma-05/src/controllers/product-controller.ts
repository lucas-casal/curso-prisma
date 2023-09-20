import { Request, Response } from "express";
import httpStatus from "http-status";

import productService from "../services/product-service";

async function getProducts(_req: Request, res: Response) {
  const products = await productService.getProducts();
  res.send(products);
}

async function createProduct(req: Request, res: Response) {
  const body = req.body;
  await productService.createProduct(body);

  res.sendStatus(httpStatus.CREATED);
}

async function getProduct(req: Request, res: Response) {
  const {id} = req.params;
  const product = await productService.getProduct(Number(id))

  res.send(product)
  
}

const productController = {
  getProducts,
  getProduct,
  createProduct
}

export default productController;