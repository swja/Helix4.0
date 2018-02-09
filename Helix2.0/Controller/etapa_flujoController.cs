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
    public class etapa_flujoController : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/etapa_flujo
        public IQueryable<etapa_flujo> Getetapa_flujo()
        {
            return db.etapa_flujo;
        }

        // GET: api/etapa_flujo/5
        [ResponseType(typeof(etapa_flujo))]
        public IHttpActionResult Getetapa_flujo(int id)
        {
            etapa_flujo etapa_flujo = db.etapa_flujo.Find(id);
            if (etapa_flujo == null)
            {
                return NotFound();
            }

            return Ok(etapa_flujo);
        }

        // PUT: api/etapa_flujo/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putetapa_flujo(int id, etapa_flujo etapa_flujo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != etapa_flujo.ID)
            {
                return BadRequest();
            }

            db.Entry(etapa_flujo).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!etapa_flujoExists(id))
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

        // POST: api/etapa_flujo
        [ResponseType(typeof(etapa_flujo))]
        public IHttpActionResult Postetapa_flujo(etapa_flujo etapa_flujo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.etapa_flujo.Add(etapa_flujo);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (etapa_flujoExists(etapa_flujo.ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = etapa_flujo.ID }, etapa_flujo);
        }

        // DELETE: api/etapa_flujo/5
        [ResponseType(typeof(etapa_flujo))]
        public IHttpActionResult Deleteetapa_flujo(int id)
        {
            etapa_flujo etapa_flujo = db.etapa_flujo.Find(id);
            if (etapa_flujo == null)
            {
                return NotFound();
            }

            db.etapa_flujo.Remove(etapa_flujo);
            db.SaveChanges();

            return Ok(etapa_flujo);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool etapa_flujoExists(int id)
        {
            return db.etapa_flujo.Count(e => e.ID == id) > 0;
        }
    }
}