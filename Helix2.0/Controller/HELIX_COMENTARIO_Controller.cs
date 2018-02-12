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
    public class HELIX_COMENTARIO_Controller : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/HELIX_COMENTARIO_
        public IQueryable<HELIX_COMENTARIO> GetHELIX_COMENTARIO()
        {
            return db.HELIX_COMENTARIO;
        }

        // GET: api/HELIX_COMENTARIO_/5
        [ResponseType(typeof(HELIX_COMENTARIO))]
        public IHttpActionResult GetHELIX_COMENTARIO(int id)
        {
            HELIX_COMENTARIO hELIX_COMENTARIO = db.HELIX_COMENTARIO.Find(id);
            if (hELIX_COMENTARIO == null)
            {
                return NotFound();
            }

            return Ok(hELIX_COMENTARIO);
        }

        // PUT: api/HELIX_COMENTARIO_/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHELIX_COMENTARIO(int id, HELIX_COMENTARIO hELIX_COMENTARIO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != hELIX_COMENTARIO.ID_USUARIO)
            {
                return BadRequest();
            }

            db.Entry(hELIX_COMENTARIO).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HELIX_COMENTARIOExists(id))
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

        // POST: api/HELIX_COMENTARIO_
        [ResponseType(typeof(HELIX_COMENTARIO))]
        public IHttpActionResult PostHELIX_COMENTARIO(HELIX_COMENTARIO hELIX_COMENTARIO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HELIX_COMENTARIO.Add(hELIX_COMENTARIO);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (HELIX_COMENTARIOExists(hELIX_COMENTARIO.ID_USUARIO))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = hELIX_COMENTARIO.ID_USUARIO }, hELIX_COMENTARIO);
        }

        // DELETE: api/HELIX_COMENTARIO_/5
        [ResponseType(typeof(HELIX_COMENTARIO))]
        public IHttpActionResult DeleteHELIX_COMENTARIO(int id)
        {
            HELIX_COMENTARIO hELIX_COMENTARIO = db.HELIX_COMENTARIO.Find(id);
            if (hELIX_COMENTARIO == null)
            {
                return NotFound();
            }

            db.HELIX_COMENTARIO.Remove(hELIX_COMENTARIO);
            db.SaveChanges();

            return Ok(hELIX_COMENTARIO);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HELIX_COMENTARIOExists(int id)
        {
            return db.HELIX_COMENTARIO.Count(e => e.ID_USUARIO == id) > 0;
        }
    }
}