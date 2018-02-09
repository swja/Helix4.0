using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Helix2._0.Model;

namespace Helix2._0.Controller
{
    public class descripcion_productoController : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/descripcion_producto
        public IQueryable<descripcion_producto> Getdescripcion_producto()
        {
            return db.descripcion_producto;
        }

        // GET: api/descripcion_producto/5
        [ResponseType(typeof(descripcion_producto))]
        public IHttpActionResult Getdescripcion_producto(int id)
        {
            descripcion_producto descripcion_producto = db.descripcion_producto.Find(id);
            if (descripcion_producto == null)
            {
                return NotFound();
            }

            return Ok(descripcion_producto);
        }

        // PUT: api/descripcion_producto/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putdescripcion_producto(int id, descripcion_producto descripcion_producto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != descripcion_producto.ID)
            {
                return BadRequest();
            }

            db.Entry(descripcion_producto).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!descripcion_productoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/descripcion_producto
        [ResponseType(typeof(descripcion_producto))]
        public IHttpActionResult Postdescripcion_producto(descripcion_producto descripcion_producto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.descripcion_producto.Add(descripcion_producto);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (descripcion_productoExists(descripcion_producto.ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = descripcion_producto.ID }, descripcion_producto);
        }

        // DELETE: api/descripcion_producto/5
        [ResponseType(typeof(descripcion_producto))]
        public IHttpActionResult Deletedescripcion_producto(int id)
        {
            descripcion_producto descripcion_producto = db.descripcion_producto.Find(id);
            if (descripcion_producto == null)
            {
                return NotFound();
            }

            db.descripcion_producto.Remove(descripcion_producto);
            db.SaveChanges();

            return Ok(descripcion_producto);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool descripcion_productoExists(int id)
        {
            return db.descripcion_producto.Count(e => e.ID == id) > 0;
        }
    }
}