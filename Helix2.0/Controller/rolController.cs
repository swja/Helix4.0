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
    public class rolController : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/rol
        public IQueryable<rol> Getrol()
        {
            return db.rol;
        }

        // GET: api/rol/5
        [ResponseType(typeof(rol))]
        public IHttpActionResult Getrol(int id)
        {
            rol rol = db.rol.Find(id);
            if (rol == null)
            {
                return NotFound();
            }

            return Ok(rol);
        }

        // PUT: api/rol/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putrol(int id, rol rol)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != rol.ID)
            {
                return BadRequest();
            }

            db.Entry(rol).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!rolExists(id))
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

        // POST: api/rol
        [ResponseType(typeof(rol))]
        public IHttpActionResult Postrol(rol rol)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.rol.Add(rol);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (rolExists(rol.ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = rol.ID }, rol);
        }

        // DELETE: api/rol/5
        [ResponseType(typeof(rol))]
        public IHttpActionResult Deleterol(int id)
        {
            rol rol = db.rol.Find(id);
            if (rol == null)
            {
                return NotFound();
            }

            db.rol.Remove(rol);
            db.SaveChanges();

            return Ok(rol);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool rolExists(int id)
        {
            return db.rol.Count(e => e.ID == id) > 0;
        }
    }
}