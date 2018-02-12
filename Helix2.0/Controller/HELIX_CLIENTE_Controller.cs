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
    public class HELIX_CLIENTE_Controller : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/HELIX_CLIENTE_
        public IQueryable<HELIX_CLIENTE> GetHELIX_CLIENTE()
        {
            return db.HELIX_CLIENTE;
        }

        // GET: api/HELIX_CLIENTE_/5
        [ResponseType(typeof(HELIX_CLIENTE))]
        public IHttpActionResult GetHELIX_CLIENTE(int id)
        {
            HELIX_CLIENTE hELIX_CLIENTE = db.HELIX_CLIENTE.Find(id);
            if (hELIX_CLIENTE == null)
            {
                return NotFound();
            }

            return Ok(hELIX_CLIENTE);
        }

        // PUT: api/HELIX_CLIENTE_/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHELIX_CLIENTE(int id, HELIX_CLIENTE hELIX_CLIENTE)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != hELIX_CLIENTE.ID_CLIENTE)
            {
                return BadRequest();
            }

            db.Entry(hELIX_CLIENTE).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HELIX_CLIENTEExists(id))
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

        // POST: api/HELIX_CLIENTE_
        [ResponseType(typeof(HELIX_CLIENTE))]
        public IHttpActionResult PostHELIX_CLIENTE(HELIX_CLIENTE hELIX_CLIENTE)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HELIX_CLIENTE.Add(hELIX_CLIENTE);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = hELIX_CLIENTE.ID_CLIENTE }, hELIX_CLIENTE);
        }

        // DELETE: api/HELIX_CLIENTE_/5
        [ResponseType(typeof(HELIX_CLIENTE))]
        public IHttpActionResult DeleteHELIX_CLIENTE(int id)
        {
            HELIX_CLIENTE hELIX_CLIENTE = db.HELIX_CLIENTE.Find(id);
            if (hELIX_CLIENTE == null)
            {
                return NotFound();
            }

            db.HELIX_CLIENTE.Remove(hELIX_CLIENTE);
            db.SaveChanges();

            return Ok(hELIX_CLIENTE);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HELIX_CLIENTEExists(int id)
        {
            return db.HELIX_CLIENTE.Count(e => e.ID_CLIENTE == id) > 0;
        }
    }
}