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
    public class HELIX_USUARIO_Controller : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/HELIX_USUARIO_
        public IQueryable<HELIX_USUARIO> GetHELIX_USUARIO()
        {
            return db.HELIX_USUARIO;
        }

        // GET: api/HELIX_USUARIO_/5
        [ResponseType(typeof(HELIX_USUARIO))]
        public IHttpActionResult GetHELIX_USUARIO(int id)
        {
            HELIX_USUARIO hELIX_USUARIO = db.HELIX_USUARIO.Find(id);
            if (hELIX_USUARIO == null)
            {
                return NotFound();
            }

            return Ok(hELIX_USUARIO);
        }

        // PUT: api/HELIX_USUARIO_/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHELIX_USUARIO(int id, HELIX_USUARIO hELIX_USUARIO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != hELIX_USUARIO.ID_USUARIO)
            {
                return BadRequest();
            }

            db.Entry(hELIX_USUARIO).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HELIX_USUARIOExists(id))
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

        // POST: api/HELIX_USUARIO_
        [ResponseType(typeof(HELIX_USUARIO))]
        public IHttpActionResult PostHELIX_USUARIO(HELIX_USUARIO hELIX_USUARIO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HELIX_USUARIO.Add(hELIX_USUARIO);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = hELIX_USUARIO.ID_USUARIO }, hELIX_USUARIO);
        }

        // DELETE: api/HELIX_USUARIO_/5
        [ResponseType(typeof(HELIX_USUARIO))]
        public IHttpActionResult DeleteHELIX_USUARIO(int id)
        {
            HELIX_USUARIO hELIX_USUARIO = db.HELIX_USUARIO.Find(id);
            if (hELIX_USUARIO == null)
            {
                return NotFound();
            }

            db.HELIX_USUARIO.Remove(hELIX_USUARIO);
            db.SaveChanges();

            return Ok(hELIX_USUARIO);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HELIX_USUARIOExists(int id)
        {
            return db.HELIX_USUARIO.Count(e => e.ID_USUARIO == id) > 0;
        }
    }
}