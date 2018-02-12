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
    public class HELIX_FORMA_PAGO_Controller : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/HELIX_FORMA_PAGO_
        public IQueryable<HELIX_FORMA_PAGO> GetHELIX_FORMA_PAGO()
        {
            return db.HELIX_FORMA_PAGO;
        }

        // GET: api/HELIX_FORMA_PAGO_/5
        [ResponseType(typeof(HELIX_FORMA_PAGO))]
        public IHttpActionResult GetHELIX_FORMA_PAGO(int id)
        {
            HELIX_FORMA_PAGO hELIX_FORMA_PAGO = db.HELIX_FORMA_PAGO.Find(id);
            if (hELIX_FORMA_PAGO == null)
            {
                return NotFound();
            }

            return Ok(hELIX_FORMA_PAGO);
        }

        // PUT: api/HELIX_FORMA_PAGO_/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHELIX_FORMA_PAGO(int id, HELIX_FORMA_PAGO hELIX_FORMA_PAGO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != hELIX_FORMA_PAGO.ID_FORMAPAGO)
            {
                return BadRequest();
            }

            db.Entry(hELIX_FORMA_PAGO).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HELIX_FORMA_PAGOExists(id))
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

        // POST: api/HELIX_FORMA_PAGO_
        [ResponseType(typeof(HELIX_FORMA_PAGO))]
        public IHttpActionResult PostHELIX_FORMA_PAGO(HELIX_FORMA_PAGO hELIX_FORMA_PAGO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HELIX_FORMA_PAGO.Add(hELIX_FORMA_PAGO);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = hELIX_FORMA_PAGO.ID_FORMAPAGO }, hELIX_FORMA_PAGO);
        }

        // DELETE: api/HELIX_FORMA_PAGO_/5
        [ResponseType(typeof(HELIX_FORMA_PAGO))]
        public IHttpActionResult DeleteHELIX_FORMA_PAGO(int id)
        {
            HELIX_FORMA_PAGO hELIX_FORMA_PAGO = db.HELIX_FORMA_PAGO.Find(id);
            if (hELIX_FORMA_PAGO == null)
            {
                return NotFound();
            }

            db.HELIX_FORMA_PAGO.Remove(hELIX_FORMA_PAGO);
            db.SaveChanges();

            return Ok(hELIX_FORMA_PAGO);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HELIX_FORMA_PAGOExists(int id)
        {
            return db.HELIX_FORMA_PAGO.Count(e => e.ID_FORMAPAGO == id) > 0;
        }
    }
}